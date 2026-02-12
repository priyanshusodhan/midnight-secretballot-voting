# 📁 Complete Folder Structure Setup Guide

## 🎯 Submission Requirements from WhatsApp Message

Based on the submission requirements, your repository MUST have:

1. ✅ **Frontend code** - User interface files
2. ✅ **Smart contract code** - Midnight .compact contracts
3. ✅ **Docker related files** - For containerization
4. ✅ **Detailed README file** - With all required sections

---

## 📂 Required Folder Structure

```
midnight-secretballot-voting/
│
├── 📁 frontend/                          ← REQUIRED: Frontend code
│   ├── public/
│   │   ├── index.html
│   │   ├── favicon.ico
│   │   └── manifest.json
│   │
│   ├── src/
│   │   ├── 📁 components/                ← React components
│   │   │   ├── Navbar.jsx
│   │   │   ├── Footer.jsx
│   │   │   ├── WalletConnect.jsx
│   │   │   ├── PollCard.jsx
│   │   │   ├── VoteModal.jsx
│   │   │   ├── CreatePollForm.jsx
│   │   │   ├── ResultsChart.jsx
│   │   │   └── LoadingSpinner.jsx
│   │   │
│   │   ├── 📁 pages/                     ← Page components
│   │   │   ├── Home.jsx
│   │   │   ├── Dashboard.jsx
│   │   │   ├── CreatePoll.jsx
│   │   │   ├── PollDetails.jsx
│   │   │   ├── Vote.jsx
│   │   │   ├── Results.jsx
│   │   │   └── Admin.jsx
│   │   │
│   │   ├── 📁 services/                  ← API and blockchain services
│   │   │   ├── api.js                    ← Backend API calls
│   │   │   ├── midnightService.js        ← Midnight blockchain integration
│   │   │   ├── walletService.js          ← Lace wallet connection
│   │   │   └── zkProofService.js         ← ZK proof generation
│   │   │
│   │   ├── 📁 utils/                     ← Utility functions
│   │   │   ├── constants.js
│   │   │   ├── helpers.js
│   │   │   ├── formatters.js
│   │   │   └── validators.js
│   │   │
│   │   ├── 📁 hooks/                     ← Custom React hooks
│   │   │   ├── useWallet.js
│   │   │   ├── useContract.js
│   │   │   └── usePolls.js
│   │   │
│   │   ├── 📁 context/                   ← React Context
│   │   │   ├── WalletContext.jsx
│   │   │   ├── PollContext.jsx
│   │   │   └── AuthContext.jsx
│   │   │
│   │   ├── 📁 styles/                    ← CSS files
│   │   │   ├── index.css
│   │   │   ├── App.css
│   │   │   ├── tailwind.css
│   │   │   └── custom.css
│   │   │
│   │   ├── 📁 assets/                    ← Images, icons, etc.
│   │   │   ├── images/
│   │   │   ├── icons/
│   │   │   └── logo.png
│   │   │
│   │   ├── App.jsx                       ← Main App component
│   │   ├── index.js                      ← Entry point
│   │   └── config.js                     ← Frontend configuration
│   │
│   ├── package.json                      ← Frontend dependencies
│   ├── package-lock.json
│   ├── .env.example                      ← Environment variables template
│   ├── tailwind.config.js                ← Tailwind configuration
│   ├── postcss.config.js
│   └── README.md                         ← Frontend documentation
│
├── 📁 contracts/                         ← REQUIRED: Smart contract code
│   ├── voting.compact                    ← Main voting contract (Midnight)
│   ├── zkProof.compact                   ← Zero-knowledge proof contract
│   ├── governance.compact                ← Governance functions
│   │
│   ├── 📁 lib/                          ← Contract libraries
│   │   ├── utils.compact
│   │   └── crypto.compact
│   │
│   ├── 📁 scripts/                      ← Deployment & interaction scripts
│   │   ├── deploy.js                    ← Deploy contracts
│   │   ├── deploy.sh                    ← Bash deployment script
│   │   ├── interact.js                  ← Contract interaction examples
│   │   ├── setup.js                     ← Initial setup script
│   │   └── verify.js                    ← Verify deployed contracts
│   │
│   ├── 📁 tests/                        ← Contract tests
│   │   ├── voting.test.js
│   │   ├── zkProof.test.js
│   │   └── integration.test.js
│   │
│   ├── 📁 abi/                          ← Contract ABIs (if applicable)
│   │   ├── voting.abi.json
│   │   └── zkProof.abi.json
│   │
│   ├── package.json                     ← Contract dependencies
│   ├── hardhat.config.js                ← Hardhat config (if used)
│   ├── midnight.config.js               ← Midnight-specific config
│   └── README.md                        ← Contract documentation
│
├── 📁 backend/                          ← Backend server (if separate)
│   ├── 📁 src/
│   │   ├── 📁 controllers/             ← Request handlers
│   │   │   ├── pollController.js
│   │   │   ├── voteController.js
│   │   │   └── userController.js
│   │   │
│   │   ├── 📁 models/                  ← Database models
│   │   │   ├── Poll.js
│   │   │   ├── Vote.js
│   │   │   └── User.js
│   │   │
│   │   ├── 📁 routes/                  ← API routes
│   │   │   ├── polls.js
│   │   │   ├── votes.js
│   │   │   └── users.js
│   │   │
│   │   ├── 📁 services/                ← Business logic
│   │   │   ├── midnightService.js
│   │   │   ├── voteService.js
│   │   │   ├── zkService.js
│   │   │   └── cacheService.js
│   │   │
│   │   ├── 📁 middleware/              ← Express middleware
│   │   │   ├── auth.js
│   │   │   ├── validate.js
│   │   │   ├── errorHandler.js
│   │   │   └── rateLimiter.js
│   │   │
│   │   ├── 📁 config/                  ← Configuration
│   │   │   ├── database.js
│   │   │   ├── midnight.js
│   │   │   └── env.js
│   │   │
│   │   ├── 📁 utils/                   ← Backend utilities
│   │   │   ├── logger.js
│   │   │   ├── helpers.js
│   │   │   └── constants.js
│   │   │
│   │   └── server.js                   ← Express app entry point
│   │
│   ├── package.json                    ← Backend dependencies
│   ├── .env.example
│   └── README.md
│
├── 📁 docker/                           ← REQUIRED: Docker files
│   ├── Dockerfile                       ← Main Dockerfile
│   ├── Dockerfile.frontend              ← Frontend container
│   ├── Dockerfile.backend               ← Backend container
│   ├── Dockerfile.midnight              ← Midnight node container
│   ├── docker-compose.yml               ← Orchestration file
│   ├── docker-compose.dev.yml           ← Development setup
│   ├── docker-compose.prod.yml          ← Production setup
│   ├── .dockerignore                    ← Files to ignore
│   │
│   └── 📁 scripts/                     ← Docker utility scripts
│       ├── start.sh
│       ├── stop.sh
│       └── rebuild.sh
│
├── 📁 docs/                            ← Additional documentation
│   ├── API.md                          ← API documentation
│   ├── DEPLOYMENT.md                   ← Deployment guide
│   ├── ARCHITECTURE.md                 ← System architecture
│   ├── USER_GUIDE.md                   ← User manual
│   ├── DEVELOPER_GUIDE.md              ← Development setup
│   └── TROUBLESHOOTING.md              ← Common issues
│
├── 📁 screenshots/                     ← REQUIRED: UI Screenshots
│   ├── 01-landing-page.png             ← Must include!
│   ├── 02-wallet-connect.png           ← Must include!
│   ├── 03-dashboard.png                ← Must include!
│   ├── 04-create-poll.png              ← Must include!
│   ├── 05-vote-casting.png             ← Must include!
│   ├── 06-results-display.png          ← Must include!
│   ├── 07-admin-panel.png              ← Optional
│   └── 08-mobile-view.png              ← Optional
│
├── 📁 scripts/                         ← Utility scripts
│   ├── setup.sh                        ← Initial setup script
│   ├── start-all.sh                    ← Start all services
│   ├── deploy-all.sh                   ← Deploy everything
│   └── test-all.sh                     ← Run all tests
│
├── 📁 config/                          ← Global configuration
│   ├── midnight.config.js              ← Midnight network config
│   ├── network.config.js               ← Network settings
│   └── constants.js                    ← Global constants
│
├── 📁 .github/                         ← GitHub specific files
│   ├── workflows/
│   │   ├── ci.yml                      ← CI/CD pipeline
│   │   └── deploy.yml                  ← Auto deployment
│   └── ISSUE_TEMPLATE.md
│
├── README.md                            ← REQUIRED: Main README
├── LICENSE                              ← Project license
├── CONTRIBUTING.md                      ← Contribution guidelines
├── .gitignore                          ← Git ignore rules
├── .env.example                        ← Environment template
├── package.json                         ← Root package.json (monorepo)
└── lerna.json / pnpm-workspace.yaml    ← If using monorepo
```

---

## 🔍 README.md Must Contain (From WhatsApp Requirements)

Your README.md MUST include these exact sections:

### ✅ 1. Project Title
```markdown
# SecretBallot - Anonymous Voting System
```

### ✅ 2. Project Description
```markdown
## Project Description
[Detailed description of what your project does]
```

### ✅ 3. Project Vision
```markdown
## Project Vision
[Your vision for the project's impact and future]
```

### ✅ 4. Project Installation & Setup Guide
```markdown
## Installation & Setup Guide

### Prerequisites
- List all requirements

### Frontend Setup
1. Step-by-step instructions

### Backend Setup
1. Step-by-step instructions

### Smart Contract Setup
1. Deployment instructions
```

### ✅ 5. Deployment Related Details
```markdown
## Deployment Details

### Deployed Contract ID / Address
- **Network**: Midnight Testnet
- **Contract ID**: midnight:voting:v1.0.0
- **Contract Address**: 0x...
- **Deployment Date**: February 11, 2026
- **Status**: Active ✓

### Deployment Verification
- Transaction Hash: 0x...
- Block Number: ...
- Deployer Address: ...
```

### ✅ 6. UI Screenshots
```markdown
## UI Screenshots

### Landing Page
![Landing](screenshots/01-landing-page.png)

### Wallet Connection
![Wallet](screenshots/02-wallet-connect.png)

[Include at least 5-7 screenshots]
```

### ✅ 7. Project Future Scope
```markdown
## Project Future Scope

### Planned Features
- Feature 1
- Feature 2
- Feature 3

### Scalability Plans
- Plan 1
- Plan 2
```

---

## 🎬 Demo Video Must Show (From WhatsApp Requirements)

Your demo video MUST demonstrate:

### ✅ 1. Midnight Blockchain Running Locally
- Show terminal with Midnight node running
- Display node status and sync info
- Prove network connectivity

### ✅ 2. Lace Wallet is Funded
- Show Lace wallet extension
- Display wallet balance
- Confirm test tokens available

### ✅ 3. Contract is Deployed
- Show deployment confirmation
- Display contract address/ID
- Prove contract is active on chain

### ✅ 4. Connect Wallet Feature Working
- Click "Connect Wallet" button
- Show wallet popup
- Demonstrate successful connection
- Display connected address in UI

### ✅ 5. Smart Contract Functions Called from UI
**Must show the complete flow:**

```
Frontend → User Action → Transaction → Smart Contract → Response → UI Update
```

**Specific demonstrations required:**

a) **Create Poll:**
   - Fill form in UI
   - Submit transaction
   - Show wallet approval
   - Confirm contract call
   - Display new poll created

b) **Cast Vote:**
   - Select vote option
   - Generate ZK proof
   - Submit vote transaction
   - Show contract verification
   - Display vote recorded

c) **View Results:**
   - Query contract for results
   - Display real-time tallies
   - Show vote verification

d) **Prevent Double Voting:**
   - Attempt to vote again
   - Show rejection by contract
   - Explain nullifier mechanism

---

## 📋 Quick Setup Checklist

Use this checklist to ensure your repo meets ALL requirements:

### Folder Structure
- [ ] `/frontend` folder exists with all React code
- [ ] `/contracts` folder exists with .compact files
- [ ] `/docker` folder exists with Dockerfile and docker-compose.yml
- [ ] `/screenshots` folder with at least 5 images
- [ ] `/docs` folder with additional documentation

### README.md Sections
- [ ] Project Title
- [ ] Project Description
- [ ] Project Vision
- [ ] Installation & Setup Guide
- [ ] Deployment Details (with contract ID/address)
- [ ] UI Screenshots (minimum 5)
- [ ] Project Future Scope
- [ ] Demo Video Link

### Smart Contracts
- [ ] Main voting.compact contract
- [ ] Deployment scripts in `/contracts/scripts`
- [ ] Contract tests in `/contracts/tests`
- [ ] README.md in contracts folder

### Docker Files
- [ ] Dockerfile for frontend
- [ ] Dockerfile for backend
- [ ] docker-compose.yml for orchestration
- [ ] .dockerignore file

### Documentation
- [ ] Main README.md is comprehensive
- [ ] API documentation
- [ ] Deployment guide
- [ ] User guide

### Demo Video Requirements
- [ ] Shows Midnight node running
- [ ] Shows funded Lace wallet
- [ ] Shows deployed contract
- [ ] Demonstrates wallet connection
- [ ] Shows frontend-to-contract interaction
- [ ] Demonstrates all major features
- [ ] Under 10 minutes duration
- [ ] Uploaded to YouTube
- [ ] Link added to README

---

## 🚀 Quick Start Commands

Create the folder structure quickly:

```bash
# Navigate to your project
cd midnight-secretballot-voting

# Create all required folders
mkdir -p frontend/src/{components,pages,services,utils,hooks,context,styles,assets}
mkdir -p frontend/public
mkdir -p contracts/{scripts,tests,abi,lib}
mkdir -p backend/src/{controllers,models,routes,services,middleware,config,utils}
mkdir -p docker/scripts
mkdir -p docs
mkdir -p screenshots
mkdir -p scripts
mkdir -p config
mkdir -p .github/workflows

# Create placeholder files
touch frontend/package.json
touch frontend/README.md
touch contracts/voting.compact
touch contracts/package.json
touch contracts/README.md
touch docker/Dockerfile
touch docker/docker-compose.yml
touch backend/src/server.js
touch backend/package.json
touch README.md
touch LICENSE
touch .gitignore
touch .env.example

echo "✅ Folder structure created!"
```

---

## 📤 Final Submission Checklist

Before submitting, verify:

### Repository Requirements
- [ ] Repository name matches project title
- [ ] All folders from reference structure exist
- [ ] README.md has all required sections
- [ ] Screenshots folder has at least 5 images
- [ ] Docker files are present
- [ ] Smart contracts are in `/contracts`
- [ ] Frontend code is in `/frontend`

### Demo Video Requirements
- [ ] Video shows Midnight blockchain running
- [ ] Video shows funded Lace wallet
- [ ] Video shows deployed contract
- [ ] Video shows wallet connection
- [ ] Video shows contract interactions
- [ ] Video is under 10 minutes
- [ ] Video link is in README
- [ ] Video is public/unlisted on YouTube

### Documentation Requirements
- [ ] README has project description
- [ ] README has installation guide
- [ ] README has deployment details
- [ ] README has contract ID/address
- [ ] README has future scope section
- [ ] Screenshots are embedded in README
- [ ] All links work correctly

### Code Quality
- [ ] Code is well-commented
- [ ] No sensitive data in repository
- [ ] .env.example provided
- [ ] Dependencies documented
- [ ] Tests included (if applicable)

---

## ✅ Ready to Submit!

Once all checklist items are completed:

1. **Final Git Commands:**
```bash
git add .
git commit -m "Final project submission - SecretBallot complete"
git push origin main
```

2. **Go to Submission Portal:**
   - Visit the "Submit your Final Project" tab
   - Connect your GitHub account
   - Select repository: `midnight-secretballot-voting`
   - Click Submit

3. **Verify Submission:**
   - Check that all files are visible
   - Confirm README renders correctly
   - Test demo video link
   - Ensure screenshots display

---

## 🆘 Common Issues & Fixes

### Issue: "Repository structure doesn't match"
**Fix:** Ensure you have these exact folders:
- `/frontend`
- `/contracts` (NOT `/smartcontracts`)
- `/docker`

### Issue: "README missing required sections"
**Fix:** Copy the template README provided earlier and fill in all sections

### Issue: "Screenshots not showing"
**Fix:**
- Check file paths in README
- Ensure images are in `/screenshots` folder
- Use relative paths: `![Title](screenshots/image.png)`

### Issue: "Demo video not accessible"
**Fix:**
- Make video Public or Unlisted on YouTube
- Copy the full URL including https://
- Test the link in incognito mode

---

You now have everything needed for a complete submission! 🎉
