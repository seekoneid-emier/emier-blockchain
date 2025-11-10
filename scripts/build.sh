#!/bin/bash

echo "🏗️  Building Emier Blockchain..."

# Check Rust installation
if ! command -v cargo &> /dev/null; then
    echo "❌ Rust is not installed. Please install Rust from https://rustup.rs/"
    exit 1
fi

# Build release version
echo "🔨 Compiling Rust code..."
cargo build --release

echo "✅ Build completed successfully!"
echo "📦 Binary available at: target/release/emier-node"
echo "📦 CLI available at: target/release/emier-cli"

# Generate documentation
echo "📚 Generating documentation..."
cargo doc --no-deps

echo "🎉 Emier Blockchain is ready!"
