#!/bin/bash
echo "🚀 Emier Blockchain CI/CD Monitor"
echo "=================================="

# Check workflow files
echo "📋 Deployed Workflows:"
find .github/workflows -name "*.yml" -exec basename {} \; | sort

echo ""
echo "📊 Next Steps:"
echo "1. Open https://github.com/seekoneid-emier/emier-blockchain/actions"
echo "2. Wait for workflows to trigger (1-2 minutes after push)"
echo "3. Check individual workflow runs"
echo "4. Verify all tests pass"
echo ""
echo "🛠️ Available Workflows:"
echo "   ✅ CI - Automated testing & builds"
echo "   ✅ Release - Multi-platform binaries" 
echo "   ✅ Docker - Container images"
echo "   ✅ Docs - Documentation deployment"
echo "   ✅ Security - Vulnerability scanning"
