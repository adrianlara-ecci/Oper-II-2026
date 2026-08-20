void kernel_main(void) {
    volatile char* video_memory = (volatile char*) 0xB8000;
    const char* str = ">>> Hola Mundo (OS 1) <<<";
    
    // Clear screen
    for (int i = 0; i < 80 * 25 * 2; i += 2) {
        video_memory[i] = ' ';
        video_memory[i+1] = 0x07;
    }

    // Print string (White on Black)
    for (int i = 0; str[i] != '\0'; i++) {
        video_memory[i * 2] = str[i];
        video_memory[i * 2 + 1] = 0x0F;
    }
}
