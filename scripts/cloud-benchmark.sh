#!/bin/bash
set -e

INSTANCE_TYPE="c6i.4xlarge"  # 16 vCPUs, 32GB RAM
REGION="us-east-1"

echo "☁️ Deploying benchmark instance on AWS..."

# Create cloud-init config
cat > cloud-init.yaml << 'CLOUDINIT'
#cloud-config
package_update: true
packages:
  - docker.io
  - curl
  - wget
  - build-essential

runcmd:
  - curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  - source $HOME/.cargo/env
  - git clone https://github.com/emier-blockchain/emier.git
  - cd emier
  - cargo build --release
  - ./scripts/run-benchmarks.sh > benchmark-results-$(date +%Y%m%d).log
  - aws s3 cp benchmark-results-*.log s3://emier-benchmarks/
CLOUDINIT

echo "📊 Instance will automatically run benchmarks and upload results"
