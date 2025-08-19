#!/bin/bash
set -e

echo "Building Karios documentation..."

# Install dependencies
pip install -r requirements.txt

# Build HTML documentation
cd docs
make clean
make html

echo "Documentation built successfully!"
echo "Open docs/_build/html/index.html to view locally"
