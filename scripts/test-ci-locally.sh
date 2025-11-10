#!/bin/bash
echo "🧪 Testing CI Steps Locally..."

echo "1. Checking Rust setup..."
rustc --version
cargo --version

echo "2. Building project..."
cargo build --release

echo "3. Running tests..."
cargo test -- --nocapture

echo "4. Checking formatting..."
cargo fmt -- --check

echo "5. Checking clippy..."
cargo clippy -- -D warnings

echo "✅ All local tests completed"
