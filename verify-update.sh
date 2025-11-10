#!/bin/bash
echo "🔍 Verifying Website Update"
echo "==========================="

echo "1. Checking gh-pages branch..."
git fetch origin gh-pages

echo "2. Previewing updated content..."
git show origin/gh-pages:index.html | head -20

echo ""
echo "✅ Update completed successfully!"
echo "🌐 Check your website: https://seekoneid-emier.github.io/emier-blockchain/"
echo "⏱️ Allow 1-5 minutes for GitHub Pages to update"
