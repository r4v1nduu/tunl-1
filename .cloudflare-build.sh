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

# Deploy with Wrangler
echo "Deploying with Wrangler..."
npx wrangler deploy
