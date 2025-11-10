#!/bin/bash
set -e

echo "🌐 Deploying Emier Public Testnet..."

# Validator nodes configuration
VALIDATORS=(
    "validator-1:34.123.45.67:3030"
    "validator-2:35.234.56.78:3030" 
    "validator-3:36.345.67.89:3030"
    "validator-4:37.456.78.90:3030"
    "validator-5:38.567.89.01:3030"
)

# Genesis configuration
cat > config/testnet-genesis.json << 'GENESIS'
{
  "chain_id": "emier-testnet-1",
  "initial_validators": [
    {
      "name": "Emier Foundation",
      "address": "emier1validator1...",
      "stake": "1000000000"
    }
  ],
  "sharding_config": {
    "total_shards": 8,
    "regions": ["na", "eu", "asia"]
  }
}
GENESIS

echo "✅ Testnet configuration ready"
echo "📋 Validators: ${#VALIDATORS[@]} nodes"
echo "🎯 Chain ID: emier-testnet-1"
