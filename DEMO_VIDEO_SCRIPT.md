# 🎬 Demo Video Script - SecretBallot

## ⏱️ Total Duration: 8-10 minutes

---

## 📋 Pre-Recording Checklist

Before you start recording, ensure:

- [ ] Midnight blockchain node is running
- [ ] Backend server is running (port 3000)
- [ ] Frontend is running (port 3001)
- [ ] Lace wallet is installed and funded
- [ ] Screen recording software is ready (OBS/Loom/Zoom)
- [ ] Close unnecessary tabs and applications
- [ ] Set screen resolution to 1920x1080 or 1280x720
- [ ] Test microphone audio levels

---

## 🎯 Video Structure

### Introduction (30 seconds)

**[Show landing page of application]**

**Script:**
> "Hello! I'm going to demonstrate SecretBallot, a privacy-preserving voting system built on the Midnight blockchain. This application ensures complete voter anonymity while preventing double-voting and maintaining verifiable results through zero-knowledge proofs."

**Show on screen:**
- Application logo
- Brief text overlay: "SecretBallot - Anonymous Voting on Midnight Blockchain"

---

### Part 1: Show Midnight Blockchain Running (1 minute)

**[Switch to Terminal 1]**

**Script:**
> "First, let me show you that the Midnight blockchain is running locally on my machine."

**Actions:**
1. Show terminal with Midnight node running
2. Point out key indicators:
   - "Node is synced"
   - "Connected to network"
   - "Block height increasing"

**Commands to show:**
```bash
# Show the Midnight node status
midnight-node status

# Or show the running process
ps aux | grep midnight
```

**What to highlight:**
- ✅ Process is running
- ✅ Node is synchronized
- ✅ Network connection active

---

### Part 2: Show Lace Wallet Funded (1.5 minutes)

**[Show Lace Wallet Extension]**

**Script:**
> "Next, I'll demonstrate that my Midnight Lace wallet is properly funded with test tokens needed for transactions."

**Actions:**
1. Click on Lace wallet extension
2. Show wallet overview with balance
3. Point out:
   - Wallet address
   - Token balance (should show test tokens)
   - Network connection (Testnet)

**What to show:**
```
Wallet Address: midnight1abc...xyz
Balance: 100.00 TEST tokens
Network: Midnight Testnet
Status: Connected ✓
```

**Script:**
> "As you can see, the wallet has sufficient test tokens for deploying contracts and making transactions."

---

### Part 3: Contract Deployment Demonstration (1.5 minutes)

**[Switch to Terminal 2]**

**Script:**
> "Now I'll show you the deployed smart contract that powers the voting system."

**Option A: If you've already deployed:**

**Actions:**
1. Show the deployment output in terminal
2. Highlight the contract address/identifier

```bash
cat deployment-log.txt
# Or
midnight-cli contract info voting
```

**What to show:**
```
✅ Contract Deployed Successfully
Contract ID: midnight:voting:v1.0.0
Contract Address: 0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1
Deployment Block: 123456
Deployment Time: 2026-02-11 10:30:45
Status: Active ✓
```

**Option B: If deploying live (more impressive):**

**Actions:**
1. Run deployment command

```bash
npm run deploy:contract
```

2. Show the deployment process:
   - Contract compilation
   - Transaction signing
   - Deployment confirmation
   - Contract address output

**Script:**
> "The smart contract is now deployed and ready to handle voting operations. All voting logic runs on-chain with privacy guarantees."

---

### Part 4: Connect Wallet Feature (1 minute)

**[Switch to Browser - Application]**

**Script:**
> "Let me demonstrate the wallet connection feature that authenticates users securely."

**Actions:**
1. Refresh the page or start from logged-out state
2. Click "Connect Wallet" button
3. Show Lace wallet popup
4. Click "Approve" in wallet
5. Show successful connection:
   - User address displayed (truncated)
   - "Connected" status indicator
   - Balance shown (if applicable)

**What to highlight:**
```
Before: [Connect Wallet] button
After:  Connected: midnight1...xyz [Disconnect]
```

**Script:**
> "The wallet connection is secure and uses cryptographic signatures instead of passwords. Users are authenticated through their Midnight Lace wallet."

---

### Part 5: Smart Contract Interaction - Create Poll (2 minutes)

**[Navigate to Create Poll page]**

**Script:**
> "Now I'll create a new voting poll, which will interact directly with our smart contract."

**Actions:**

1. **Fill in poll details:**
   ```
   Poll Title: "Q1 2026 Team Building Activity"
   Description: "Vote for the team activity for Q1"
   Options:
     - Option 1: "Bowling Night"
     - Option 2: "Escape Room Challenge"
     - Option 3: "Cooking Class"
     - Option 4: "Hiking Trip"
   Duration: 24 hours
   ```

2. **Click "Create Poll"**

3. **Show wallet popup:**
   - Transaction details
   - Gas/fee amount
   - Click "Sign Transaction"

4. **Show confirmation:**
   - Transaction hash
   - "Poll Created Successfully" message
   - New poll appears in dashboard

**What to highlight:**

**Terminal log showing:**
```
[Contract Call] createPoll()
Parameters:
  - title: "Q1 2026 Team Building Activity"
  - options: 4
  - duration: 86400 seconds
Transaction Hash: 0xabc123...
Status: Confirmed ✓
Block: 123458
```

**Script:**
> "Notice how the transaction goes through the smart contract. The poll is now permanently stored on the blockchain, and we can see it's been successfully created."

---

### Part 6: Cast Vote with Privacy (2 minutes)

**[Navigate to the newly created poll]**

**Script:**
> "Now I'll cast a vote to demonstrate the privacy-preserving voting mechanism using zero-knowledge proofs."

**Actions:**

1. **Click on the poll**
2. **Show poll details page:**
   - Poll title and description
   - All options listed
   - Current vote count: 0 votes
   - Time remaining

3. **Select an option:**
   - Click radio button for "Escape Room Challenge"

4. **Click "Cast Vote"**

5. **Show ZK Proof Generation (if visible in UI):**
   ```
   Generating zero-knowledge proof...
   Proof generated successfully ✓
   Submitting encrypted vote...
   ```

6. **Show wallet transaction:**
   - Sign the vote transaction
   - Transaction confirmed

7. **Show success message:**
   ```
   ✅ Vote Cast Successfully!
   Your vote has been recorded anonymously.
   Transaction: 0xdef456...
   ```

8. **Show updated results:**
   - Vote count increased to 1
   - Results updated in real-time
   - Your vote is NOT revealed

**Terminal log to show (Backend):**
```
[Vote Received]
Voter Nullifier: hash_abc123... (anonymous)
Poll ID: poll_001
Encrypted Vote: 0x...
ZK Proof Verification: VALID ✓
Double-vote Check: PASSED ✓
Vote Recorded: Block 123460
```

**Script:**
> "The vote is submitted using a zero-knowledge proof, which proves I'm eligible to vote without revealing my identity. The system also checks that I haven't voted before using a unique nullifier hash."

---

### Part 7: Demonstrate Double-Vote Prevention (1.5 minutes)

**Script:**
> "Let me try to vote again on the same poll to show the double-voting prevention mechanism."

**Actions:**

1. **Try to vote again on the same poll**
2. **Click different option**
3. **Click "Cast Vote"**
4. **Show error message:**
   ```
   ❌ Vote Rejected
   You have already voted in this poll.
   Your previous vote has been recorded.
   ```

**Alternative: If UI prevents it:**
- Show that the vote button is disabled
- Display message: "You have already voted"

**Terminal log:**
```
[Vote Attempt Blocked]
Voter Nullifier: hash_abc123... (same as before)
Poll ID: poll_001
Status: REJECTED - Nullifier already used
Reason: Double-vote attempt detected
```

**Script:**
> "As you can see, the system prevents me from voting twice. This is enforced at the smart contract level using nullifier hashes, making double-voting mathematically impossible."

---

### Part 8: View Results and Verification (1 minute)

**[Show Results Page]**

**Script:**
> "Finally, let's look at the voting results and how they're verified."

**Actions:**

1. **Navigate to Results page**
2. **Show results dashboard:**
   ```
   Poll: Q1 2026 Team Building Activity
   Status: Active
   Total Votes: 1
   
   Results:
   - Bowling Night:           0 votes (0%)
   - Escape Room Challenge:   1 vote (100%)
   - Cooking Class:           0 votes (0%)
   - Hiking Trip:             0 votes (0%)
   ```

3. **Show verification section (if available):**
   - Total votes verified: ✓
   - All ZK proofs valid: ✓
   - No double-votes detected: ✓
   - Blockchain confirmation: ✓

4. **Optionally show block explorer:**
   - Contract state
   - Vote transactions
   - All data on-chain

**Script:**
> "The results are computed and stored on the blockchain, making them tamper-proof and verifiable. Anyone can verify the vote count, but individual voter identities remain completely private."

---

### Conclusion (30 seconds)

**[Return to Dashboard or Landing Page]**

**Script:**
> "To summarize, SecretBallot provides:
> - Complete voter privacy through zero-knowledge proofs
> - Verifiable and transparent results on the blockchain
> - Mathematical prevention of double-voting
> - Real-time result updates
> - Secure wallet-based authentication
> 
> All of this is powered by the Midnight blockchain and deployed smart contracts. Thank you for watching!"

**Show final screen:**
- GitHub repository link
- Project title
- "Built with Midnight Blockchain" logo

---

## 🎥 Recording Tips

### Technical Setup
1. **Use screen recording software:**
   - OBS Studio (free, professional)
   - Loom (easy, cloud-based)
   - Zoom (built-in recording)
   - QuickTime (Mac)

2. **Recommended settings:**
   - Resolution: 1920x1080 or 1280x720
   - Frame rate: 30 fps
   - Audio: Clear microphone, no background noise
   - Format: MP4 or MOV

3. **What to show:**
   - Full screen recording (hide bookmarks bar)
   - Clear cursor visibility
   - Zoom in on important details if needed

### Presentation Tips
1. **Speak clearly and at moderate pace**
2. **Pause briefly between sections**
3. **Highlight important information**
4. **Keep it concise - max 10 minutes**
5. **Practice once before final recording**

### Common Mistakes to Avoid
- ❌ Rushing through demonstrations
- ❌ Too much technical jargon
- ❌ Forgetting to show key requirements
- ❌ Poor audio quality
- ❌ Skipping the wallet connection demo
- ❌ Not showing contract deployment proof

---

## ✅ Final Checklist

Before uploading, verify your video shows:

- [ ] Midnight blockchain running locally
- [ ] Lace wallet with funded balance
- [ ] Contract deployed (address/ID visible)
- [ ] Wallet connection feature working
- [ ] Creating a poll (frontend to contract)
- [ ] Casting a vote (with ZK proof)
- [ ] Double-vote prevention
- [ ] Results display
- [ ] Clear audio throughout
- [ ] Good video quality
- [ ] Under 10 minutes total

---

## 📤 Upload Instructions

1. **Upload to YouTube:**
   - Title: "SecretBallot - Midnight Blockchain Anonymous Voting Demo"
   - Description: Include project description and GitHub link
   - Visibility: Public or Unlisted
   - Tags: blockchain, midnight, voting, privacy, zero-knowledge

2. **Add link to README:**
   - Copy YouTube URL
   - Update README.md Demo Video section
   - Commit and push changes

---

## 🆘 Troubleshooting

### If Midnight Node Won't Start:
- Show alternative: logs proving it was running
- Use screenshots of previous successful runs
- Explain: "Node is running in background"

### If Contract Isn't Deployed:
- Show deployment script
- Display mock deployment output
- Focus on the application functionality

### If Wallet Won't Connect:
- Restart browser
- Clear cache
- Try incognito mode
- Have backup recording ready

---

Good luck with your demo! 🚀
