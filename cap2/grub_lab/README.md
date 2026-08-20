# Laboratorio: Multiboot y GRUB

## Instrucciones de Uso

1. Dar permisos de ejecución al script:
   `chmod +x build.sh`

2. Compilar los kernels y generar la ISO:
   `./build.sh`

3. Probar en QEMU:
   `qemu-system-x86_64 -cdrom os_lab.iso`
