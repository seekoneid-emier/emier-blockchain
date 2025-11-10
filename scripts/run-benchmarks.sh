#!/bin/bash
set -e

echo "📊 Starting Comprehensive Blockchain Benchmark..."

# System info
echo "🖥️  System Configuration:"
lscpu | grep "Model name\|CPU(s)"
free -h

# Emier Benchmark
echo "🚀 Emier Benchmark..."
./target/release/emier-benchmark

# Install and compare with other chains
compare_chains() {
    # Ethereum (via Erigon)
    echo "⛓️  Ethereum Benchmark..."
    if command -v erigon &> /dev/null; then
        timeout 30s erigon --metrics --datadir /tmp/ethereum-data &
        sleep 10
        curl -s http://localhost:6060/debug/metrics | grep "chaindata\\|txpool"
        pkill erigon
    fi

    # Solana
    echo "🔶 Solana Benchmark..."
    if command -v solana-test-validator &> /dev/null; then
        solana-test-validator --reset &
        sleep 15
        solana bench-tps --duration 10
        pkill solana-test-validator
    fi
}

compare_chains

echo "✅ All benchmarks completed"
