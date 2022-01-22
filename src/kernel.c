void kernel_main() {
    char* vidmem = (char*)0xb8000;
    vidmem[0] = 'L';
    vidmem[1] = 0x07;
}
