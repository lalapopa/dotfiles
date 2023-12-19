#!/usr/bin/env bash 

# Get the relative path to the file
file_path=$1

# Get the parent directory of the file
parent_dir=$(dirname "$file_path")

# Create all parent directories if they don't exist
mkdir -p "$2${parent_dir:2}"

# Copy the file to the new directory
echo cp "$file_path" "$2${parent_dir:2}"
cp "$file_path" "$2${parent_dir:2}"
