#!/bin/sh
# Script otomatis membuat rootfs.img dari folder rootfs untuk exoplanetOS

ROOTFS_DIR=./rootfs
OUTPUT_IMG=./output/rootfs.img

# Pastikan folder output ada
mkdir -p ./output

# Masuk ke folder rootfs
cd "$ROOTFS_DIR" || exit 1

# Buat image initramfs (cpio gzip)
find . | cpio -o -H newc | gzip > "$OUTPUT_IMG"

cd - > /dev/null

echo "rootfs.img berhasil dibuat di output/rootfs.img"