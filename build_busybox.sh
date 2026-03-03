#!/bin/sh
# Script otomatis build BusyBox untuk exoplanetOS

# Set folder busybox (ganti jika perlu)
BUSYBOX_DIR=./busybox
CONFIG_FILE=../configs/busybox.config

# Masuk ke folder busybox
cd "$BUSYBOX_DIR" || exit 1

# Copy konfigurasi busybox
cp "$CONFIG_FILE" .config

# Build busybox
make olddefconfig
make -j$(nproc)

# Copy hasil build ke rootfs/bin
mkdir -p ../rootfs/bin
cp busybox ../rootfs/bin/

# (Opsional) Buat symlink utilitas dasar
cd ../rootfs/bin
for app in sh ls cp mv rm mkdir echo cat dmesg mount umount; do
  [ -e "$app" ] || ln -s busybox "$app"
done

echo "Build BusyBox selesai. Hasil: rootfs/bin/busybox dan symlink utilitas dasar."
