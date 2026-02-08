# 🗳️ SecretBallot - Midnight Bootcamp Project #21

**Student:** Priyanshu Sodhan  
**Institution:** IIIT NR (First Year CSE)  
**Date:** February 8, 2026  
**GitHub:** https://github.com/priyanshusodhan/midnight-secretballot-voting

---

## 🎯 Project Objective

Build a privacy-preserving voting system that demonstrates **selective disclosure** using Midnight's Zero-Knowledge technology.

## 🔐 Core Innovation: The Witness Pattern
```compact
pragma language_version 0.15;

import CompactStandardLibrary;

export ledger yesVotes: Counter;
export ledger noVotes: Counter;

export circuit castVote(choice: Witness<Bool>): [] {
  if (choice.value) {
    yesVotes.increment(1);
  } else {
    noVotes.increment(1);
  }
}
```

### Why This Matters:

**Traditional Blockchain:**
- Everyone sees your vote ❌
- Enables voter coercion ❌
- No privacy ❌

**SecretBallot with Midnight:**
- Your vote stays private ✅
- Results are verifiable ✅
- Zero-Knowledge proofs ✅

## 📊 How It Works

Your MacBook keeps the vote private (Witness), generates a mathematical proof, and only the proof goes to the blockchain. The network verifies the proof and updates the public tally without ever knowing how you voted.

## 🏆 Bootcamp Requirements Met

✅ **Shielded State**: `Witness<Bool>` keeps vote private  
✅ **Public Ledger**: `Counter` types for transparent tallies  
✅ **ZK-Proofs**: Compact auto-generates proofs for witnesses  
✅ **Selective Disclosure**: Only aggregate counts published  

## 💡 Key Learnings

1. **ZK-Proofs are Practical** - Not just theoretical cryptography
2. **Privacy ≠ Opacity** - Can have both privacy AND verification
3. **Type Systems for Privacy** - Language-level privacy guarantees via `Witness<T>`
4. **Paradigm Shift** - Thinking in terms of "what should be public vs private"

## �� Repository

**GitHub:** https://github.com/priyanshusodhan/midnight-secretballot-voting

---

**Built for Midnight Blockchain Bootcamp 2026 - IIIT NR**
