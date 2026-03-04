#!/bin/bash

# Assets Sync Script
# Keeps local and remote GitHub repo in sync

echo "🔄 Starting sync with GitHub..."

# Pull latest changes from remote
echo "⬇️  Pulling changes from GitHub..."
git pull origin main

# Check if there are local changes
if [[ -n $(git status -s) ]]; then
    echo "📦 Found local changes, committing..."

    # Stage all changes (respects .gitignore)
    git add .

    # Commit with timestamp
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"

    # Push to remote
    echo "⬆️  Pushing changes to GitHub..."
    git push origin main

    echo "✅ Sync complete!"
else
    echo "✅ Already in sync, no changes to push"
fi
