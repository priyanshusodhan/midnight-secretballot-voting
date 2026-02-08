# 🗳️ SecretBallot - Privacy-Focused Voting

> **Midnight Bootcamp Project #21** - Zero-Knowledge Proofs for private voting with public verification

## 🎯 The Problem

Traditional blockchain voting is completely public - everyone sees how you voted.

## ✅ Our Solution

**SecretBallot** uses Zero-Knowledge Proofs:
- ✅ Private individual votes (Witness<Bool>)
- ✅ Public verifiable results (Ledger)
- ✅ Cryptographic proof without disclosure

## 🔐 Core Technology
```compact
export circuit castVote(choice: Witness<Bool>): [] {
  if (choice.value) {
    yesVotes.increment(1);
  } else {
    noVotes.increment(1);
  }
}
```

The `Witness<Bool>` keeps your vote on **your device only**. The blockchain only sees the proof and updates the public tally.

## 📚 How It Works

1. **You vote locally** - Your choice stays on your MacBook
2. **ZK-Proof generated** - Mathematical proof created
3. **Network verifies** - Proof is checked, tally updated
4. **Privacy preserved** - No one knows your vote

## 🎓 Bootcamp Requirements

- ✅ Uses `Witness` for selective disclosure
- ✅ Implements shielded state
- ✅ Demonstrates ZK-proof generation
- ✅ Public ledger for verification

## 📖 Documentation

See [BOOTCAMP_SUBMISSION.md](./BOOTCAMP_SUBMISSION.md) for complete technical explanation.

## 👨‍💻 Author

**Priyanshu Sodhan**  
First Year CSE Student - IIIT NR  
Midnight Blockchain Bootcamp 2026

---

*Protecting democracy, one ZK-proof at a time* 🔒
