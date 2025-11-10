#!/bin/bash
echo "🎥 Emier Live Demo - Recording Starting..."

# Demo sections
echo "1. 🚀 Starting Emier Node"
cargo run --bin emier-node -- --port 3030 &
NODE_PID=$!
sleep 3

echo "2. 💻 CLI Demo"
cargo run --bin emier-cli -- account create
cargo run --bin emier-cli -- transaction send Alice Bob 150.0

echo "3. 🌐 Cross-Chain Demo"  
cargo run --bin cross-chain-dex

echo "4. 📊 Benchmark Demo"
cargo run --bin emier-benchmark

echo "5. 🛠️ Development Demo"
cargo run --bin emier-dev

# Cleanup
kill $NODE_PID
echo "✅ Demo recording complete!"
