#!/bin/bash
#
# deploy-html-to-sphinx.sh - Fixed version
# Deploy pre-built HTML docs from bastion to sphinx server
#
# Upload this to bastion: scp deploy-html-to-sphinx.sh ec2-user@bastion:~/
# Make executable: chmod +x ~/deploy-html-to-sphinx.sh
#

set -euo pipefail

if [ -z "$1" ]; then
    echo "Usage: $0 <docs-archive.tar.gz | html-dir> [language]"
    echo "Examples:"
    echo "  $0 /tmp/docs-en.tar.gz en"
    echo "  $0 ~/html en"
    exit 1
fi

DOCS_FILE="$1"
LANGUAGE="${2:-en}"

SRC_TYPE="archive"
if [ -d "$DOCS_FILE" ]; then
    SRC_TYPE="dir"
elif [ -f "$DOCS_FILE" ]; then
    SRC_TYPE="archive"
else
    echo "Error: Source $DOCS_FILE not found"
    exit 1
fi

DOCS_FILENAME=$(basename "$DOCS_FILE")

echo "📦 Deploying documentation: $DOCS_FILENAME (Language: $LANGUAGE)"
echo "📤 Copying to docs-server..."

if [ "$SRC_TYPE" = "archive" ]; then
    # Copy archive to docs-server /tmp/

    # Archive-only deployment: extract remotely on docs-server using gzip→tar streaming
    echo "🔨 Deploying on docs-server (archive extract)..."
    ssh -tt docs-server "sudo bash -lc 'set -euo pipefail; \
        rm -rf /tmp/sphinx-deploy; \
        mkdir -p /tmp/sphinx-deploy; \
        gzip -dc /tmp/$DOCS_FILENAME | tar -C /tmp/sphinx-deploy -xvf -; \
        test -f /tmp/sphinx-deploy/html/index.html; \
        rm -rf /var/www/sphinx-docs/*; \
        cp -r /tmp/sphinx-deploy/html/* /var/www/sphinx-docs/; \
        chown -R nginx:nginx /var/www/sphinx-docs/ || chown -R www-data:www-data /var/www/sphinx-docs/; \
        chmod -R 755 /var/www/sphinx-docs/; \
        find /var/www/sphinx-docs -type f -exec chmod 644 {} \;; \
        rm -rf /tmp/sphinx-deploy /tmp/$DOCS_FILENAME; \
        echo \"✅ Deployed to /var/www/sphinx-docs/\"; \
        echo \"📊 File count: \$(find /var/www/sphinx-docs -type f | wc -l)\"'"
        echo \"✅ Deployed to /var/www/sphinx-docs/\"; \
        echo \"📊 File count: \$(find /var/www/sphinx-docs -type f | wc -l)\"'"
fi

[ "$SRC_TYPE" = "archive" ] && rm -rf "$TMPDIR"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Documentation deployed successfully!"
    if [ "$LANGUAGE" = "it" ]; then
        echo "🌐 https://docs.karios.ai/it/"
    else
        echo "🌐 https://docs.karios.ai/"
    fi
else
    echo "❌ Deployment failed!"
    exit 1
fi
