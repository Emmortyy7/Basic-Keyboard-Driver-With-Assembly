nasm -f bin -o driver.bin driver.asm # COMPILE ASM AS BIN
qemu-system-i386 -vga std -drive file=driver.bin,format=raw  # RUN BIN AS FLOPPY DISK
