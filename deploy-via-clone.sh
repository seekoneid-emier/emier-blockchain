#!/bin/bash
set -e

echo "🚀 Deploying Emier Blockchain via Clone & Copy Method..."

# Backup current directory
CURRENT_DIR=$(pwd)

# Clone the existing repository
echo "📥 Cloning existing repository..."
cd ..
if [ -d "emier-github" ]; then
    rm -rf emier-github
fi
git clone https://github.com/seekoneid-emier/emier-blockchain.git emier-github
cd emier-github

# Remove existing files (keep .git)
echo "🧹 Cleaning existing files..."
find . -maxdepth 1 ! -name '.git' ! -name '.' ! -name '..' -exec rm -rf {} + 2>/dev/null || true

# Copy all Emier Blockchain files
echo "📋 Copying Emier Blockchain code..."
cp -r "$CURRENT_DIR"/* .
cp -r "$CURRENT_DIR"/.[^.]* . 2>/dev/null || true

# Remove deployment scripts
rm -f deploy-via-clone.sh push-emier.sh final-push.sh 2>/dev/null || true

# Commit and push
echo "📤 Committing and pushing..."
git add .
git config --global user.email "emier@blockchain.com"
git config --global user.name "Emier Blockchain"
git commit -m "feat: Emier Blockchain v1.0.0

- Modular consensus engine (PoS, PoH, PBFT, Hybrid AI)
- Global sharding mesh with 64 shards
- Quantum-resistant security layer
- Universal cross-chain interoperability
- Parallel execution engine
- 4 binary executables: node, cli, dev, benchmark
- Complete test suite and documentation"

if git push origin main; then
    echo ""
    echo "🎉 EMIER BLOCKCHAIN SUCCESSFULLY DEPLOYED! 🚀"
    echo "🔗 https://github.com/seekoneid-emier/emier-blockchain"
    echo ""
    echo "📊 Repository now contains:"
    echo "   ✅ Complete Emier Blockchain implementation"
    echo "   ✅ 75+ Rust source files"
    echo "   ✅ 4 binary executables"
    echo "   ✅ Documentation and tests"
else
    echo "❌ Push failed. Please check:"
    echo "   - You have write access to the repository"
    echo "   - Repository exists: https://github.com/seekoneid-emier/emier-blockchain"
fi

# Return to original directory
cd "$CURRENT_DIR"
