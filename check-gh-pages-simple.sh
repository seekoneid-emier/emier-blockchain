#!/bin/bash
echo "🔍 Simple gh-pages Check"
echo "========================"

echo "1. Checking remote branches..."
git fetch origin

echo "2. Listing all branches..."
git branch -r | grep gh-pages

echo "3. Checking if gh-pages has index.html..."
if git show origin/gh-pages:index.html > /dev/null 2>&1; then
    echo "✅ SUCCESS: index.html found!"
    echo "First line of index.html:"
    git show origin/gh-pages:index.html | head -1
else
    echo "❌ FAILED: No index.html in gh-pages"
fi
