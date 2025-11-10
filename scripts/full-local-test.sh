#!/bin/bash
echo "🧪 Comprehensive Local Test"
echo "============================"

echo "1. Checking Cargo.toml..."
cargo verify-project && echo "✅ Cargo.toml valid" || echo "❌ Cargo.toml invalid"

echo "2. Building project..."
cargo build --release && echo "✅ Build successful" || echo "❌ Build failed"

echo "3. Running tests..."
cargo test -- --nocapture && echo "✅ Tests passed" || echo "❌ Tests failed"

echo "4. Checking formatting..."
cargo fmt -- --check && echo "✅ Formatting OK" || echo "❌ Formatting issues"

echo "5. Checking clippy..."
cargo clippy -- -D warnings && echo "✅ Clippy OK" || echo "❌ Clippy warnings"

echo "6. Final verification..."
cargo check --release && echo "🎉 All checks passed!" || echo "💥 Some checks failed"
