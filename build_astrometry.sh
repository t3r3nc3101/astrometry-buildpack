#!/usr/bin/env bash
# Exit on error
set -e

# Navigate to the build directory
cd $BUILD_DIR

# Download and extract Astrometry.net
wget http://astrometry.net/downloads/astrometry.net-latest.tar.gz
tar xvzf astrometry.net-latest.tar.gz
cd astrometry.net-*

# Build Astrometry.net
make
make py
make extra
make install INSTALL_DIR=/app/astrometry

# Ensure the binaries are executable
chmod +x /app/astrometry/bin/*
