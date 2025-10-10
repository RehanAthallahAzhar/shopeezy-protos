#!/bin/bash


# Stop script if an error occurs
set -e

SRC_DIR="proto"
DEST_DIR="pb"

# Clear the destination directory
echo "Clear the destination directory '$DEST_DIR'"
rm -rf "$DEST_DIR"
mkdir -p "$DEST_DIR"

echo "Generate code from '$SRC_DIR' to '$DEST_DIR'..."

protoc \
  --proto_path=${SRC_DIR} \
  --go_out=${DEST_DIR} --go_opt=paths=source_relative \
  --go-grpc_out=${DEST_DIR} --go-grpc_opt=paths=source_relative \
  $(find "${SRC_DIR}" -name "*.proto")

echo "finish"