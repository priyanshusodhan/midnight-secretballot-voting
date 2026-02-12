const express = require("express");
const cors = require("cors");
const path = require("path");

const app = express();
const PORT = 3000;

// =====================
// Middleware
// =====================
app.use(cors());
app.use(express.json());

// =====================
// In-Memory Vote Storage
// (for demo – no database)
// =====================
let yesVotes = 0;
let noVotes = 0;
const votedUsers = new Set();

// =====================
// Serve Frontend
// =====================

// Serve static files from frontend folder
app.use(express.static(path.join(__dirname, "../frontend")));

// When visiting http://localhost:3000
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "../frontend/index.html"));
});

// =====================
// API ROUTES
// =====================

// Health Check
app.get("/api/health", (req, res) => {
  res.json({
    success: true,
    message: "Backend running successfully 🚀"
  });
});

// Get vote results
app.get("/api/votes", (req, res) => {
  res.json({
    success: true,
    yesVotes,
    noVotes,
    totalVoters: yesVotes + noVotes
  });
});

// Submit vote
app.post("/api/vote", (req, res) => {
  const { voterId, choice, zkProof } = req.body;

  // Basic validation
  if (!voterId || typeof choice !== "boolean" || !zkProof) {
    return res.status(400).json({
      success: false,
      error: "Invalid vote data"
    });
  }

  // Prevent double voting
  if (votedUsers.has(voterId)) {
    return res.status(400).json({
      success: false,
      error: "User has already voted!"
    });
  }

  // Record vote
  if (choice) {
    yesVotes++;
  } else {
    noVotes++;
  }

  votedUsers.add(voterId);

  // Fake transaction id
  const transactionId = "tx_" + Date.now();

  res.json({
    success: true,
    message: "Vote recorded successfully",
    transactionId,
    verificationTime: "45ms"
  });
});

// =====================
// Start Server
// =====================
app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
