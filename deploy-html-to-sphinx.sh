#!/bin/bash
#
# deploy-html-to-sphinx.sh
# Simple script to deploy pre-built HTML docs from bastion to sphinx server
#
# Upload this to bastion: /home/ec2-user/deploy-html-to-sphinx.sh
# Make executable: chmod +x /home/ec2-user/deploy-html-to-sphinx.sh
#

set -e

ARCHIVE_FILE="$1"

if [ -z "$ARCHIVE_FILE" ]; then
  echo "❌ Error: No archive file specified"
  echo "Usage: $0 <docs-archive.tar.gz>"
  exit 1
fi

if [ ! -f "$ARCHIVE_FILE" ]; then
  echo "❌ Error: Archive file not found: $ARCHIVE_FILE"
  exit 1
fi

echo "📦 Deploying: $ARCHIVE_FILE"
echo "🚀 Bastion → Sphinx Server"
echo ""

# Copy archive to docs-server
echo "📤 Copying to docs-server..."
scp "$ARCHIVE_FILE" docs-server:/tmp/

# Extract and deploy on sphinx server
echo "🔨 Extracting and deploying on sphinx server..."
ssh sphinx-server << 'EOF'
  # Move to sphinx home
  sudo mv /tmp/docs-en.tar.gz /home/sphinx/ 2>/dev/null || sudo mv /tmp/*.tar.gz /home/sphinx/docs-en.tar.gz
  sudo chown sphinx:sphinx /home/sphinx/docs-en.tar.gz
  
  # Extract to temp
  cd /home/sphinx
  rm -rf /tmp/sphinx-deploy
  mkdir -p /tmp/sphinx-deploy
  tar -xzf docs-en.tar.gz -C /tmp/sphinx-deploy
  
  # Deploy to nginx web directory
  sudo rm -rf /var/www/sphinx-docs/*
  sudo cp -r /tmp/sphinx-deploy/html/* /var/www/sphinx-docs/
  sudo chown -R nginx:nginx /var/www/sphinx-docs
  
  # Cleanup
  rm -rf /tmp/sphinx-deploy
  rm -f /home/sphinx/docs-en.tar.gz
  
  echo "✅ Deployed to /var/www/sphinx-docs/"
  echo "📊 File count: $(find /var/www/sphinx-docs -type f | wc -l)"
EOF

echo ""
echo "✅ Deployment complete!"
echo "🌐 https://docs.karios.ai/"
