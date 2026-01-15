#!/bin/bash
#
# deploy-html-to-sphinx.sh - Fixed version with race condition protection
#

# Acquire lock to prevent concurrent deployments
LOCKFILE="/tmp/deploy-sphinx.lock"
exec 200>"$LOCKFILE"
if ! flock -n 200; then
    echo "⏳ Another deployment is in progress, waiting..."
    flock 200
fi
echo "🔒 Lock acquired"

if [ -z "$1" ]; then
    echo "Usage: $0 <documentation-tar-file> [language]"
    exit 1
fi

DOCS_FILE="$1"
LANGUAGE="${2:-en}"

if [ ! -f "$DOCS_FILE" ]; then
    echo "Error: File $DOCS_FILE not found"
    exit 1
fi

DOCS_FILENAME=$(basename "$DOCS_FILE")

echo "📦 Deploying documentation: $DOCS_FILENAME (Language: $LANGUAGE)"
echo "📤 Copying to docs-server..."

# Copy to docs-server
if ! scp "$DOCS_FILE" docs-server:/tmp/; then
    echo "❌ File transfer failed!"
    exit 1
fi
echo "✅ Copied to docs-server"

# Move file to sphinx home with proper ownership
ssh docs-server "sudo mv /tmp/$DOCS_FILENAME /home/sphinx/ && sudo chown sphinx:sphinx /home/sphinx/$DOCS_FILENAME"

# Deploy HTML on sphinx server (no heredoc - use -c instead)
echo "🔨 Deploying on sphinx-server..."
ssh sphinx-server "cd /home/sphinx && \
    rm -rf sphinx-deploy && \
    mkdir -p sphinx-deploy && \
    tar -xzf $DOCS_FILENAME -C sphinx-deploy && \
    rm -rf /tmp/sphinx-build && \
    mkdir -p /tmp/sphinx-build && \
    cp -r sphinx-deploy/html/* /tmp/sphinx-build/ && \
    sudo /usr/local/bin/deploy-sphinx-docs.sh /var/www/sphinx-docs && \
    rm -rf sphinx-deploy /tmp/sphinx-build && \
    rm -f $DOCS_FILENAME && \
    echo '✅ Deployed to /var/www/sphinx-docs/' && \
    echo \"📊 File count: \$(find /var/www/sphinx-docs -type f | wc -l)\""

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Documentation deployed successfully!"
    echo "🌐 https://docs.karios.ai/"
else
    echo "❌ Deployment failed!"
    exit 1
fi