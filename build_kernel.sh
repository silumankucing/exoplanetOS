#!/bin/sh
# Script otomatis build kernel Linux untuk exoplanetOS

# Set folder kernel (ganti jika perlu)
KERNEL_DIR=./kernel
CONFIG_FILE=../configs/kernel.config

# Masuk ke folder kernel
cd "$KERNEL_DIR" || exit 1

# Copy konfigurasi kernel
cp "$CONFIG_FILE" .config

# Build kernel
make olddefconfig
make -j$(nproc)

# Copy hasil build ke folder output
mkdir -p ../output
cp arch/x86/boot/bzImage ../output/

echo "Build kernel selesai. Hasil: output/bzImage"
