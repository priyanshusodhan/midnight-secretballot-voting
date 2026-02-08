# SecretBallot - Midnight Blockchain Bootcamp Project #21

## The Privacy Problem We Solve
Traditional blockchain voting exposes every vote publicly. SecretBallot uses Zero-Knowledge proofs to keep votes private while maintaining verifiable results.

## How It Works
1. **Local Computation**: Vote choice stays on your device
2. **ZK-Proof Generation**: Mathematical proof created locally
3. **On-Chain Verification**: Only the tally updates publicly

## Technology Stack
- Midnight Blockchain
- Compact Language
- Zero-Knowledge Proofs

## Running the Project
```bash
npm install
npm run compile
open index.html
```

## Key Features
- ✅ Private voting (Witness<boolean>)
- ✅ Public verifiable tallies
- ✅ No voter coercion possible
- ✅ 100% transparent results

## Bootcamp Requirements Met
- [x] Uses Witness for selective disclosure
- [x] Implements shielded state
- [x] Demonstrates ZK-proof generation
- [x] Public ledger for verification