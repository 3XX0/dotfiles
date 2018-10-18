#! /bin/sh

set -ex

DISK=/dev/nvme0n1
ROOT=b947229c-7c9d-b346-b92f-adaaed5e7d22

efibootmgr --verbose --disk $DISK --part 1 --create --label "Archlinux" --loader /vmlinuz-linux --unicode \
    "root=PARTUUID=$ROOT rw initrd=\intel-ucode.img initrd=\initramfs-linux.img intel_iommu=on"
