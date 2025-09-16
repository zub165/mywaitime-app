#!/bin/bash

echo "🔒 Starting ER Wait Time with HTTPS..."
echo "=================================="

# Check if OpenSSL is installed
if ! command -v openssl &> /dev/null; then
    echo "❌ OpenSSL is not installed. Please install it first:"
    echo "   Ubuntu/Debian: sudo apt-get install openssl"
    echo "   macOS: brew install openssl"
    echo "   Windows: Download from https://slproweb.com/products/Win32OpenSSL.html"
    exit 1
fi

# Check if certificates exist
if [ ! -f "./server.key" ] || [ ! -f "./server.crt" ]; then
    echo "🔐 Creating SSL certificates..."
    openssl genrsa -out server.key 2048
    openssl req -new -x509 -key server.key -out server.crt -days 365 -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"
    echo "✅ SSL certificates created"
fi

# Start the HTTPS server
echo "🚀 Starting HTTPS server on port 3002..."
echo "🌐 Open your browser and go to: https://localhost:3002"
echo "⚠️  You may see a security warning - click 'Advanced' and 'Proceed to localhost'"
echo ""

node https-server.js
