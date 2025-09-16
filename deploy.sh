#!/bin/bash

# Stop any running instance
pm2 stop er-wait-time || true

# Install dependencies
npm install --production

# Build the application (if needed)
# npm run build

# Copy environment variables
cp .env.production .env

# Start the application with PM2
pm2 start server.js --name "er-wait-time" --env production

# Save PM2 process list
pm2 save

echo "Deployment completed successfully!" 