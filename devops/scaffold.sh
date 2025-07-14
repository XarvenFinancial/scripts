#!/bin/bash

# Script to import and initialize a project scaffold from the scaffolds repository
# Usage: ./import.sh <group> <target> <name>
# Example: ./import.sh rust service my_new_service

set -e  # Exit on any error


# Function to cleanup temporary files
cleanup() {
    echo "Cleaning up temporary files..."
    rm -rf temp_repo
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

git clone --depth=1 --filter=blob:none --sparse https://github.com/XarvenFinancial/scaffolds.git temp_repo
cd temp_repo
git sparse-checkout set import.sh --skip-checks
./temp_repo/import.sh $1 $2 $3
