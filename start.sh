#!/bin/bash

echo "🚀 Starting Modular ER Wait Time Frontend..."
echo "=============================================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

# Set port
export PORT=3002

# Start the server
echo "🌐 Starting server on port $PORT..."
echo "🔗 Open your browser and go to: http://localhost:$PORT"
echo "🔗 External access: http://208.109.215.53:$PORT"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

node server.js
