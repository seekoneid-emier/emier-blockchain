#!/bin/bash
echo "🔍 Comprehensive Workflow Status Check"
echo "======================================"

echo "📊 Checking local environment..."
echo "Rust Version: $(rustc --version)"
echo "Cargo Version: $(cargo --version)"
echo "Docker Version: $(docker --version 2>/dev/null || echo 'Docker not installed')"

echo ""
echo "🧪 Running Local Tests..."
cargo check && echo "✅ cargo check - PASS" || echo "❌ cargo check - FAIL"
cargo test --no-run && echo "✅ cargo test compile - PASS" || echo "❌ cargo test compile - FAIL"

echo ""
echo "📦 Checking Documentation..."
if command -v mdbook &> /dev/null; then
    mdbook build docs/ && echo "✅ mdbook build - PASS" || echo "❌ mdbook build - FAIL"
else
    echo "⚠️ mdbook not installed"
fi

echo ""
echo "🐳 Checking Docker..."
docker build -t emier-test . > /dev/null 2>&1 && echo "✅ Docker build - PASS" || echo "❌ Docker build - FAIL"

echo ""
echo "🎯 NEXT: Copy error messages from GitHub Actions"
