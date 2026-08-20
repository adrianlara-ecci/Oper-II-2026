#!/bin/bash
set -e

echo "Compilando archivos..."
as --32 boot.s -o boot.o

gcc -m32 -c kernel_hw.c -o kernel_hw.o -ffreestanding -O2 -Wall -Wextra
gcc -m32 -T linker.ld -o iso/boot/kernel_hw.bin -ffreestanding -O2 -nostdlib boot.o kernel_hw.o -lgcc

gcc -m32 -c kernel_wh.c -o kernel_wh.o -ffreestanding -O2 -Wall -Wextra
gcc -m32 -T linker.ld -o iso/boot/kernel_wh.bin -ffreestanding -O2 -nostdlib boot.o kernel_wh.o -lgcc

echo "Generando ISO..."
grub-mkrescue -o os_lab.iso iso

echo "¡Listo! Ejecuta con: qemu-system-x86_64 -cdrom os_lab.iso"
