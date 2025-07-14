#!/bin/bash

# Script to import and initialize a project scaffold from the scaffolds repository
# Usage: ./import.sh <group> <target> <name>
# Example: ./import.sh rust service my_new_service

set -e  # Exit on any error

SCAFFOLD_REPO_DIR="scaffolds"

# Function to cleanup temporary files
cleanup() {
    echo "Cleaning up temporary files..."
    rm -rf $SCAFFOLD_REPO_DIR
    rm scaffold.sh
}

# Check if exactly 3 arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <group> <target> <name>"
    echo "Example: $0 rust service my_new_service"
    echo ""
    echo "Arguments:"
    echo "  group  - Subfolder in the scaffolds repository (e.g., 'rust')"
    echo "  target - Subfolder within the group (e.g., 'service')"
    echo "  name   - Name for the new project (used for initialization)"
    exit 1
fi

git clone --depth=1 https://github.com/XarvenFinancial/scaffolds.git $SCAFFOLD_REPO_DIR
./{$SCAFFOLD_REPO_DIR}/import.sh $1 $2 $3
