#!/bin/bash

# SecretBallot - Quick Setup Script
# This script creates the complete folder structure for your project

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Project name
PROJECT_NAME="midnight-secretballot-voting"

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                                                        ║${NC}"
echo -e "${BLUE}║          SecretBallot - Quick Setup Script             ║${NC}"
echo -e "${BLUE}║                                                        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if we're in the right directory
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}Warning: Not in a git repository. Continuing anyway...${NC}"
    echo ""
fi

echo -e "${GREEN}[1/8]${NC} Creating main folder structure..."

# Create main directories
mkdir -p frontend/src/{components,pages,services,utils,hooks,context,styles,assets/{images,icons}}
mkdir -p frontend/public
mkdir -p backend/src/{controllers,models,routes,services,middleware,config,utils}
mkdir -p contracts/{scripts,tests,abi,lib}
mkdir -p docker/scripts
mkdir -p docs
mkdir -p screenshots
mkdir -p scripts
mkdir -p config
mkdir -p .github/workflows

echo -e "${GREEN}✓${NC} Folder structure created"
echo ""

echo -e "${GREEN}[2/8]${NC} Creating configuration files..."

# Create .gitignore
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
/.pnp
.pnp.js

# Testing
/coverage
.nyc_output

# Production
/build
/dist

# Environment
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Midnight
.midnight/
midnight-data/

# Database
*.db
*.sqlite

# Backup
backups/
*.backup

# Temporary
tmp/
temp/
*.tmp

# Docker
docker-data/
EOF

echo -e "${GREEN}✓${NC} .gitignore created"

# Create LICENSE
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2026 SecretBallot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

echo -e "${GREEN}✓${NC} LICENSE created"
echo ""

echo -e "${GREEN}[3/8]${NC} Creating package.json files..."

# Root package.json
cat > package.json << 'EOF'
{
  "name": "midnight-secretballot-voting",
  "version": "1.0.0",
  "description": "Anonymous voting system on Midnight blockchain",
  "private": true,
  "workspaces": [
    "frontend",
    "backend",
    "contracts"
  ],
  "scripts": {
    "install:all": "npm install && cd frontend && npm install && cd ../backend && npm install && cd ../contracts && npm install",
    "start": "concurrently \"npm run start:backend\" \"npm run start:frontend\"",
    "start:frontend": "cd frontend && npm start",
    "start:backend": "cd backend && npm start",
    "start:midnight": "midnight-node start --network testnet",
    "deploy:contract": "cd contracts && npm run deploy",
    "test": "npm run test:backend && npm run test:frontend && npm run test:contracts",
    "test:frontend": "cd frontend && npm test",
    "test:backend": "cd backend && npm test",
    "test:contracts": "cd contracts && npm test",
    "docker:up": "docker-compose up -d",
    "docker:down": "docker-compose down",
    "docker:rebuild": "docker-compose down && docker-compose build && docker-compose up -d",
    "lint": "eslint . --ext .js,.jsx,.ts,.tsx",
    "format": "prettier --write \"**/*.{js,jsx,ts,tsx,json,css,md}\""
  },
  "devDependencies": {
    "concurrently": "^8.2.2",
    "eslint": "^8.56.0",
    "prettier": "^3.2.4"
  },
  "engines": {
    "node": ">=18.0.0",
    "npm": ">=8.0.0"
  }
}
EOF

# Frontend package.json
cat > frontend/package.json << 'EOF'
{
  "name": "secretballot-frontend",
  "version": "1.0.0",
  "private": true,
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.22.0",
    "axios": "^1.6.7",
    "tailwindcss": "^3.4.1",
    "socket.io-client": "^4.6.1"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
EOF

# Backend package.json
cat > backend/package.json << 'EOF'
{
  "name": "secretballot-backend",
  "version": "1.0.0",
  "private": true,
  "main": "src/server.js",
  "scripts": {
    "start": "node src/server.js",
    "dev": "nodemon src/server.js",
    "test": "jest"
  },
  "dependencies": {
    "express": "^4.18.2",
    "mongoose": "^8.1.1",
    "dotenv": "^16.4.1",
    "cors": "^2.8.5",
    "jsonwebtoken": "^9.0.2",
    "bcryptjs": "^2.4.3",
    "express-validator": "^7.0.1",
    "socket.io": "^4.6.1",
    "redis": "^4.6.13"
  },
  "devDependencies": {
    "nodemon": "^3.0.3",
    "jest": "^29.7.0"
  }
}
EOF

# Contracts package.json
cat > contracts/package.json << 'EOF'
{
  "name": "secretballot-contracts",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "compile": "midnight-cli compile",
    "deploy": "node scripts/deploy.js",
    "test": "midnight-cli test",
    "interact": "node scripts/interact.js"
  },
  "dependencies": {
    "@midnight-ntwrk/midnight-js-sdk": "latest",
    "dotenv": "^16.4.1"
  }
}
EOF

echo -e "${GREEN}✓${NC} Package.json files created"
echo ""

echo -e "${GREEN}[4/8]${NC} Creating placeholder contract files..."

# Create main voting contract
cat > contracts/voting.compact << 'EOF'
// SecretBallot Voting Contract
// Midnight Compact Language

contract Voting {
    // Contract will be implemented here
    // This is a placeholder for the actual contract logic
    
    // Poll structure
    struct Poll {
        bytes32 id;
        string title;
        string[] options;
        uint256 startTime;
        uint256 endTime;
        address creator;
    }
    
    // State variables
    mapping(bytes32 => Poll) public polls;
    mapping(bytes32 => mapping(bytes32 => bool)) public nullifiers;
    mapping(bytes32 => mapping(uint256 => uint256)) public results;
    
    // Events
    event PollCreated(bytes32 indexed pollId, string title);
    event VoteCast(bytes32 indexed pollId, bytes32 nullifier);
    event PollClosed(bytes32 indexed pollId);
}
EOF

echo -e "${GREEN}✓${NC} Contract files created"
echo ""

echo -e "${GREEN}[5/8]${NC} Creating documentation files..."

# Create CONTRIBUTING.md
cat > CONTRIBUTING.md << 'EOF'
# Contributing to SecretBallot

Thank you for considering contributing to SecretBallot!

## How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Code Style

- Follow the existing code style
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

## Reporting Bugs

Please use the GitHub issue tracker to report bugs.
EOF

# Create docs/API.md
cat > docs/API.md << 'EOF'
# SecretBallot API Documentation

## Base URL
```
http://localhost:3000/api/v1
```

## Endpoints

### Polls
- `GET /polls` - Get all polls
- `POST /polls` - Create new poll
- `GET /polls/:id` - Get poll by ID
- `PUT /polls/:id` - Update poll
- `DELETE /polls/:id` - Delete poll

### Votes
- `POST /votes` - Cast a vote
- `GET /votes/:pollId` - Get votes for a poll

### Users
- `POST /auth/login` - User login
- `POST /auth/register` - User registration
- `GET /auth/me` - Get current user

Documentation will be expanded...
EOF

echo -e "${GREEN}✓${NC} Documentation files created"
echo ""

echo -e "${GREEN}[6/8]${NC} Creating deployment scripts..."

# Create deployment script
cat > contracts/scripts/deploy.js << 'EOF'
// Midnight Contract Deployment Script
require('dotenv').config();

async function main() {
  console.log('🚀 Deploying SecretBallot contracts...');
  console.log('Network:', process.env.MIDNIGHT_NETWORK);
  
  // Deployment logic will be implemented here
  // This is a placeholder
  
  console.log('✅ Contracts deployed successfully!');
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
EOF

echo -e "${GREEN}✓${NC} Deployment scripts created"
echo ""

echo -e "${GREEN}[7/8]${NC} Creating start-all script..."

# Create comprehensive start script
cat > scripts/start-all.sh << 'EOF'
#!/bin/bash

echo "Starting SecretBallot application..."

# Terminal 1: Midnight node
echo "Starting Midnight node..."
npm run start:midnight &
MIDNIGHT_PID=$!

# Wait for Midnight to start
sleep 5

# Terminal 2: Backend
echo "Starting backend server..."
cd backend && npm start &
BACKEND_PID=$!

# Wait for backend to start
sleep 3

# Terminal 3: Frontend
echo "Starting frontend..."
cd ../frontend && npm start &
FRONTEND_PID=$!

echo ""
echo "✅ All services started!"
echo "   - Midnight Node: PID $MIDNIGHT_PID"
echo "   - Backend: PID $BACKEND_PID (http://localhost:3000)"
echo "   - Frontend: PID $FRONTEND_PID (http://localhost:3001)"
echo ""
echo "Press Ctrl+C to stop all services"

# Wait for user interrupt
trap "kill $MIDNIGHT_PID $BACKEND_PID $FRONTEND_PID; exit" INT
wait
EOF

chmod +x scripts/start-all.sh

echo -e "${GREEN}✓${NC} Start script created"
echo ""

echo -e "${GREEN}[8/8]${NC} Creating screenshot placeholders..."

# Create screenshot README
cat > screenshots/README.md << 'EOF'
# Screenshots

Place your UI screenshots here with the following naming:

- 01-landing-page.png
- 02-wallet-connect.png
- 03-dashboard.png
- 04-create-poll.png
- 05-vote-casting.png
- 06-results-display.png
- 07-admin-panel.png

These screenshots will be referenced in the main README.md
EOF

echo -e "${GREEN}✓${NC} Screenshot folder configured"
echo ""

# Final summary
echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                                                        ║${NC}"
echo -e "${BLUE}║              Setup Complete! ✨                         ║${NC}"
echo -e "${BLUE}║                                                        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Your project structure is ready!${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Copy the README.md template to your project root"
echo "2. Copy Docker files to the docker/ folder"
echo "3. Copy .env.example to your project root"
echo "4. Run: ${BLUE}npm run install:all${NC} to install dependencies"
echo "5. Add your actual code to the appropriate folders"
echo "6. Take screenshots of your UI"
echo "7. Record your demo video"
echo "8. Push to GitHub and submit!"
echo ""
echo -e "${GREEN}Good luck! 🚀${NC}"
EOF

chmod +x /home/claude/setup-project.sh

echo -e "${GREEN}✓${NC} Quick setup script created"
echo ""
