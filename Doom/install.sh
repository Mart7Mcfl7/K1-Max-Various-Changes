#!/bin/sh

# K1 Max Doom Installer
# Assumes k1max-doom.tar.gz is already in /usr/data/

set -e

TAR_FILE="/usr/data/k1max-doom.tar.gz"
INSTALL_DIR="/usr/data/Doom"

echo "========================================"
echo "    K1 Max Doom Installer"
echo "========================================"
echo ""

# Check if tar file exists
if [ ! -f "$TAR_FILE" ]; then
    echo "ERROR: $TAR_FILE not found!"
    echo ""
    echo "Please upload k1max-doom.tar.gz to /usr/data/ first"
    exit 1
fi

echo "✓ Found $TAR_FILE"

# Create installation directory
echo "Creating installation directory..."
mkdir -p "$INSTALL_DIR"

# Extract tar file
echo "Extracting Doom files to $INSTALL_DIR..."
tar -xzf "$TAR_FILE" -C "$INSTALL_DIR"

# Set correct permissions
echo "Setting permissions..."
chmod 755 "$INSTALL_DIR/doom_k1max"
chmod 755 "$INSTALL_DIR/launch_doom.sh"
chmod 644 "$INSTALL_DIR/doom1.wad"

# Verify installation
echo ""
echo "Verifying installation..."
if [ -f "$INSTALL_DIR/doom_k1max" ] && \
   [ -f "$INSTALL_DIR/doom1.wad" ] && \
   [ -f "$INSTALL_DIR/launch_doom.sh" ]; then
    echo "✓ Installation successful!"
else
    echo "✗ Installation failed - missing files"
    exit 1
fi

echo ""
echo "========================================"
echo "    Installation Complete!"
echo "========================================"
echo ""
echo "To play Doom:"
echo ""
echo "  cd $INSTALL_DIR"
echo "  ./launch_doom.sh"
echo ""
echo "Have fun! 🎮"
echo ""
