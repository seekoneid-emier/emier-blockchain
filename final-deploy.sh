#!/bin/bash
set -e

echo "🚀 Final Emier Blockchain Deployment"

# Try to authenticate with token
echo "🔐 Authenticating with token..."
if echo "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" | gh auth login --with-token; then
    echo "✅ Authentication successful"
else
    echo "⚠️ Authentication failed, continuing with direct push..."
fi

# Create repository (with or without auth)
echo "📦 Creating repository..."
if GH_TOKEN="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" gh repo create emier-blockchain \
    --description "Next Generation Layer-1 Blockchain with Modular Consensus & Global Sharding" \
    --public \
    --license "Apache-2.0" \
    --gitignore Rust \
    --confirm; then
    echo "✅ Repository created"
else
    echo "⚠️ Repository creation failed, may already exist"
fi

# Configure git and push
echo "🔧 Configuring git remote..."
git remote remove origin 2>/dev/null || true
git remote add origin https://seekoneid-emier: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@github.com/seekoneid-emier/emier-blockchain.git

echo "📤 Committing and pushing code..."
git add .
git commit -m "feat: Emier Blockchain v1.0.0

- Modular consensus engine (PoS, PoH, PBFT, Hybrid AI)
- Global sharding mesh with 64 shards
- Quantum-resistant security layer
- Universal cross-chain interoperability
- Parallel execution engine
- 4 binary executables: node, cli, dev, benchmark
- Complete test suite and documentation" || echo "⚠️ No changes to commit"

git branch -M main

if git push -u origin main; then
    echo ""
    echo "🎉 EMIER BLOCKCHAIN SUCCESSFULLY DEPLOYED! 🚀"
    echo "🔗 Repository: https://github.com/seekoneid-emier/emier-blockchain"
    echo ""
    echo "📊 Next Steps:"
    echo "   1. Setup GitHub Actions CI/CD"
    echo "   2. Create technical documentation" 
    echo "   3. Deploy testnet"
    echo "   4. Start community building"
else
    echo "❌ Push failed. Please check:"
    echo "   - Repository exists at: https://github.com/seekoneid-emier/emier-blockchain"
    echo "   - Repository is empty (no README initialized)"
    echo ""
    echo "📝 If repository doesn't exist, create it at:"
    echo "   https://github.com/new?name=emier-blockchain"
fi
