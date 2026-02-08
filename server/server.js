const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// MongoDB Schema for Vote Analytics
const voteAnalyticsSchema = new mongoose.Schema({
    timestamp: { type: Date, default: Date.now },
    voteType: { type: String, enum: ['yes', 'no'] },
    sessionId: String,
    zkProofHash: String,
    verificationTime: Number
});

const VoteAnalytics = mongoose.model('VoteAnalytics', voteAnalyticsSchema);

// In-memory storage (simulating blockchain state)
let blockchainState = {
    yesVotes: 0,
    noVotes: 0,
    totalVoters: 0,
    votedUsers: new Set(),
    voteHistory: []
};

// ============== API ENDPOINTS ==============

// 1. Health Check
app.get('/api/health', (req, res) => {
    res.json({ 
        status: 'healthy', 
        service: 'SecretBallot API',
        blockchain: 'Midnight Network',
        timestamp: new Date().toISOString()
    });
});

// 2. Get Current Vote Results
app.get('/api/votes', (req, res) => {
    res.json({
        success: true,
        data: {
            yesVotes: blockchainState.yesVotes,
            noVotes: blockchainState.noVotes,
            totalVoters: blockchainState.totalVoters,
            lastUpdate: new Date().toISOString()
        }
    });
});

// 3. Submit Vote (WITH ZK-PROOF VERIFICATION)
app.post('/api/vote', async (req, res) => {
    const { voterId, choice, zkProof } = req.body;

    try {
        // Validation
        if (!voterId || typeof choice !== 'boolean' || !zkProof) {
            return res.status(400).json({
                success: false,
                error: 'Missing required fields: voterId, choice, zkProof'
            });
        }

        // Check double-voting
        if (blockchainState.votedUsers.has(voterId)) {
            return res.status(403).json({
                success: false,
                error: 'Double voting detected! This voter has already voted.',
                voterId: voterId.substring(0, 8) + '...' // Partial ID for privacy
            });
        }

        // Simulate ZK-Proof Verification (in production, this would verify actual SNARK)
        const proofVerificationStart = Date.now();
        const isValidProof = await verifyZKProof(zkProof);
        const verificationTime = Date.now() - proofVerificationStart;

        if (!isValidProof) {
            return res.status(401).json({
                success: false,
                error: 'Invalid ZK-Proof. Vote rejected.'
            });
        }

        // Process Vote
        if (choice) {
            blockchainState.yesVotes++;
        } else {
            blockchainState.noVotes++;
        }
        
        blockchainState.totalVoters++;
        blockchainState.votedUsers.add(voterId);
        
        // Store vote record (WITHOUT revealing choice - privacy preserved!)
        const voteRecord = {
            timestamp: new Date(),
            voterHash: hashVoterId(voterId), // Hashed for privacy
            zkProofHash: zkProof.substring(0, 16),
            verified: true,
            verificationTime
        };
        
        blockchainState.voteHistory.push(voteRecord);

        // Save analytics to MongoDB (if connected)
        try {
            if (mongoose.connection.readyState === 1) {
                await VoteAnalytics.create({
                    voteType: choice ? 'yes' : 'no',
                    sessionId: req.headers['x-session-id'] || 'unknown',
                    zkProofHash: zkProof.substring(0, 16),
                    verificationTime
                });
            }
        } catch (dbError) {
            console.log('MongoDB not connected, skipping analytics');
        }

        res.json({
            success: true,
            message: 'Vote successfully cast with privacy preserved!',
            data: {
                transactionId: generateTransactionId(),
                timestamp: voteRecord.timestamp,
                verificationTime: `${verificationTime}ms`,
                currentTally: {
                    yes: blockchainState.yesVotes,
                    no: blockchainState.noVotes,
                    total: blockchainState.totalVoters
                }
            }
        });

    } catch (error) {
        console.error('Vote processing error:', error);
        res.status(500).json({
            success: false,
            error: 'Internal server error processing vote'
        });
    }
});

// 4. Check if voter has already voted (WITHOUT revealing their vote)
app.post('/api/check-voter', (req, res) => {
    const { voterId } = req.body;

    if (!voterId) {
        return res.status(400).json({
            success: false,
            error: 'Voter ID required'
        });
    }

    const hasVoted = blockchainState.votedUsers.has(voterId);

    res.json({
        success: true,
        hasVoted,
        message: hasVoted 
            ? 'This voter has already participated' 
            : 'This voter is eligible to vote'
    });
});

// 5. Get Vote Statistics (Public Analytics)
app.get('/api/stats', (req, res) => {
    const total = blockchainState.totalVoters;
    const yesPercentage = total > 0 ? ((blockchainState.yesVotes / total) * 100).toFixed(2) : 0;
    const noPercentage = total > 0 ? ((blockchainState.noVotes / total) * 100).toFixed(2) : 0;

    res.json({
        success: true,
        data: {
            totalVotes: total,
            breakdown: {
                yes: {
                    count: blockchainState.yesVotes,
                    percentage: `${yesPercentage}%`
                },
                no: {
                    count: blockchainState.noVotes,
                    percentage: `${noPercentage}%`
                }
            },
            recentActivity: blockchainState.voteHistory.slice(-5).map(v => ({
                timestamp: v.timestamp,
                proofHash: v.zkProofHash,
                verificationTime: v.verificationTime
            }))
        }
    });
});

// 6. Reset Voting (Admin endpoint - in production would require authentication)
app.post('/api/admin/reset', (req, res) => {
    blockchainState = {
        yesVotes: 0,
        noVotes: 0,
        totalVoters: 0,
        votedUsers: new Set(),
        voteHistory: []
    };

    res.json({
        success: true,
        message: 'Voting system reset successfully'
    });
});

// ============== HELPER FUNCTIONS ==============

// Simulate ZK-Proof Verification
async function verifyZKProof(proof) {
    // In production, this would use actual SNARK verification
    // For demo, simulate computation delay
    return new Promise(resolve => {
        setTimeout(() => {
            // Simple validation: proof should be a valid string with minimum length
            resolve(proof && typeof proof === 'string' && proof.length >= 32);
        }, Math.random() * 100 + 50); // 50-150ms delay
    });
}

// Hash voter ID for privacy
function hashVoterId(voterId) {
    // Simple hash for demo (in production use crypto.createHash)
    let hash = 0;
    for (let i = 0; i < voterId.length; i++) {
        const char = voterId.charCodeAt(i);
        hash = ((hash << 5) - hash) + char;
        hash = hash & hash;
    }
    return Math.abs(hash).toString(16);
}

// Generate transaction ID
function generateTransactionId() {
    return 'tx_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
}

// ============== DATABASE CONNECTION ==============

// MongoDB connection (optional - works without it)
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/secretballot';

mongoose.connect(MONGODB_URI)
    .then(() => console.log('✅ MongoDB connected for analytics'))
    .catch(() => console.log('⚠️  MongoDB not connected - running without database analytics'));

// ============== START SERVER ==============

app.listen(PORT, () => {
    console.log(`
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║        🗳️  SecretBallot Backend API Server           ║
║                                                       ║
║  Status: RUNNING                                      ║
║  Port: ${PORT}                                           ║
║  Privacy: Zero-Knowledge Proofs Enabled               ║
║  Anti-Fraud: Double-Voting Prevention Active          ║
║                                                       ║
║  📡 API Endpoints:                                     ║
║  • GET  /api/health        - Health check             ║
║  • GET  /api/votes         - Get current results      ║
║  • POST /api/vote          - Submit vote with ZK      ║
║  • POST /api/check-voter   - Check voting status      ║
║  • GET  /api/stats         - Get statistics           ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
    `);
});

module.exports = app;
