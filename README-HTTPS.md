# 🔒 HTTPS Setup for ER Wait Time

## Why HTTPS is Needed

- **Geolocation API**: Modern browsers require HTTPS for location access
- **Security**: Encrypts data between browser and server
- **Modern Web APIs**: Many features only work over HTTPS

## 🚀 Quick Start with HTTPS

### Option 1: Use the HTTPS Server (Recommended)

```bash
# Start with HTTPS
npm run start:https

# Or use the script
./start-https.sh
```

Then open: `https://localhost:3002`

### Option 2: Use mkcert (Best for Development)

```bash
# Install mkcert (one-time setup)
# Ubuntu/Debian:
sudo apt install libnss3-tools
wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64
chmod +x mkcert
sudo mv mkcert /usr/local/bin/

# macOS:
brew install mkcert

# Windows:
# Download from https://github.com/FiloSottile/mkcert/releases

# Create trusted certificates
mkcert -install
mkcert localhost 127.0.0.1 ::1

# Rename certificates
mv localhost+2.pem server.crt
mv localhost+2-key.pem server.key

# Start HTTPS server
npm run start:https
```

## 🔧 Manual Setup

### 1. Create Self-Signed Certificate

```bash
# Create private key
openssl genrsa -out server.key 2048

# Create certificate
openssl req -new -x509 -key server.key -out server.crt -days 365 -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"
```

### 2. Start HTTPS Server

```bash
node https-server.js
```

## 🌐 Access Your App

- **HTTPS**: `https://localhost:3002`
- **HTTP**: `http://localhost:3002` (geolocation won't work)

## ⚠️ Security Warnings

When using self-signed certificates, browsers will show security warnings:

1. Click **"Advanced"**
2. Click **"Proceed to localhost (unsafe)"**
3. Your app will work normally

## 🎯 Benefits of HTTPS

- ✅ **Geolocation works** - No more "secure origins" errors
- ✅ **Better security** - Encrypted connections
- ✅ **Modern APIs** - Access to all browser features
- ✅ **Production ready** - Same setup as production

## 🔄 Switching Between HTTP/HTTPS

```bash
# HTTP (current)
npm start

# HTTPS (recommended)
npm run start:https
```

## 🐛 Troubleshooting

### OpenSSL Not Found
```bash
# Ubuntu/Debian
sudo apt-get install openssl

# macOS
brew install openssl

# Windows
# Download from https://slproweb.com/products/Win32OpenSSL.html
```

### Port Already in Use
```bash
# Kill process on port 3002
sudo lsof -ti:3002 | xargs kill -9

# Or use different port
PORT=3003 npm run start:https
```

### Certificate Issues
```bash
# Remove old certificates
rm server.key server.crt

# Recreate
./start-https.sh
```
