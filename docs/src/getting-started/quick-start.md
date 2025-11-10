Quick Start Guide
Prerequisites

    Rust 1.70+

    Git

Build and Run
bash

git clone https://github.com/seekoneid-emier/emier-blockchain
cd emier-blockchain

# Build
cargo build --release

# Run node
./target/release/emier-node

# Use CLI tools
./target/release/emier-cli --help
./target/release/emier-dev
./target/release/emier-benchmark

Verify Installation
bash

# Check version
./target/release/emier-cli --version

# Run tests
cargo test

