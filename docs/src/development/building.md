Building from Source
Prerequisites

    Rust programming language

    Cargo package manager

Build Steps
bash

# Clone repository
git clone https://github.com/seekoneid-emier/emier-blockchain
cd emier-blockchain

# Build in release mode
cargo build --release

# Build specific binary
cargo build --bin emier-node --release

Development Build
bash

# Debug build
cargo build

# Watch mode for development
cargo watch -x run

