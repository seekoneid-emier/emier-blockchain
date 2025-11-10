#!/bin/bash
echo "🔧 Quick Fixes untuk Common Issues"

echo "1. Membersihkan build cache..."
cargo clean

echo "2. Update toolchain..."
rustup update

echo "3. Fix formatting..."
cargo fmt

echo "4. Fix clippy warnings..."
cargo clippy --fix --allow-dirty --allow-staged

echo "5. Update dependencies..."
cargo update

echo "6. Check security vulnerabilities..."
cargo audit || echo "⚠️ Audit failed, continuing..."

echo "✅ Quick fixes applied"
