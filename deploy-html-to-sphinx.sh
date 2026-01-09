#!/bin/bash
#
# deploy-html-to-sphinx.sh
# Deploy pre-built HTML docs from bastion to sphinx server
#
# Upload this to bastion: /home/ec2-user/deploy-html-to-sphinx.sh
# Make executable: chmod +x /home/ec2-user/deploy-html-to-sphinx.sh
#

if [ -z "$1" ]; then
    echo "Usage: $0 <documentation-tar-file> [language]"
    echo "Example: $0 docs-en.tar.gz en"
    echo "Example: $0 docs-it.tar.gz it"
    echo "Languages: en (default), it"
    exit 1
fi

DOCS_FILE="$1"
LANGUAGE="${2:-en}"

if [ ! -f "$DOCS_FILE" ]; then
    echo "Error: File $DOCS_FILE not found"
    echo "Make sure you've copied the documentation archive to this directory"
    exit 1
fi

# Extract just the filename from the path
DOCS_FILENAME=$(basename "$DOCS_FILE")

echo "📦 Deploying documentation: $DOCS_FILENAME (Language: $LANGUAGE)"
echo "📤 Copying to docs-server..."

# Copy via docs-server, then move to sphinx user's home
if scp "$DOCS_FILE" docs-server:/tmp/; then
    echo "✅ Copied to docs-server"
    
    # Move file to sphinx home with proper ownership
    ssh docs-server "sudo mv /tmp/$DOCS_FILENAME /home/sphinx/ && sudo chown sphinx:sphinx /home/sphinx/$DOCS_FILENAME"
    
    # Deploy HTML on sphinx server
    echo "🔨 Deploying on sphinx-server..."
    ssh sphinx-server << EOF
        cd /home/sphinx
        rm -rf sphinx-deploy
        mkdir -p sphinx-deploy
        tar -xzf "$DOCS_FILENAME" -C sphinx-deploy
        
        # Extract HTML to /tmp/sphinx-build
        rm -rf /tmp/sphinx-build
        mkdir -p /tmp/sphinx-build
        cp -r sphinx-deploy/html/* /tmp/sphinx-build/
        
        # Use existing deployment script (has NOPASSWD sudo)
        sudo /usr/local/bin/deploy-sphinx-docs.sh /var/www/sphinx-docs
        
        # Fix permissions for nginx to read the files
        echo "🔐 Fixing permissions..."
        sudo chown -R www-data:www-data /var/www/sphinx-docs/ 2>/dev/null || sudo chown -R nginx:nginx /var/www/sphinx-docs/ 2>/dev/null || true
        sudo chmod -R 755 /var/www/sphinx-docs/
        sudo find /var/www/sphinx-docs -type f -exec chmod 644 {} \;
        
        # Cleanup
        rm -rf sphinx-deploy /tmp/sphinx-build
        rm -f "$DOCS_FILENAME"
        
        echo "✅ Deployed to /var/www/sphinx-docs/"
        echo "📊 File count: \$(find /var/www/sphinx-docs -type f | wc -l)"
        echo "📁 Permissions: \$(ls -ld /var/www/sphinx-docs)"
EOF

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
else
    echo "❌ File transfer failed!"
    exit 1
fi
