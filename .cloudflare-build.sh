#!/bin/bash
set -e

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Verify installation
rustc --version
cargo --version

# Install wasm32-unknown-unknown target (needed for Cloudflare Workers)
rustup target add wasm32-unknown-unknown

# Build the project (Cloudflare Pages will handle deployment)
echo "Building with worker-build..."
cargo install -q worker-build
worker-build --release
