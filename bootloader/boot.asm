org 0x7C00
bits 16

main:
    ; 1. Clean up segment registers
    cli                     ; Clear interrupts during initialization
    xor ax, ax              ; Zero out AX
    mov ds, ax              ; Set Data Segment (DS) to 0x0000
    mov es, ax              ; Set Extra Segment (ES) to 0x0000
    
    ; 2. Set up a safe stack area
    mov ss, ax              ; Set Stack Segment (SS) to 0x0000
    mov sp, 0x7C00          ; Set Stack Pointer (SP) just below our bootloader code
    sti                     ; Re-enable interrupts

    ; 3. Print the string
    mov si, hello_msg       ; Source Index points to our string address

.print_loop:
    lodsb                   ; Load byte at DS:SI into AL, then increment SI
    cmp al, 0               ; Check if we hit the null-terminator (0)
    je .halt                ; If AL == 0, we're done printing

    mov ah, 0x0E            ; BIOS teletype function indicator
    int 0x10                ; Trigger Video Services Interrupt
    jmp .print_loop         ; Loop back for the next character

.halt:
    hlt                     ; Halt the CPU
    jmp .halt               ; Infinite loop fallback

; Data section
hello_msg: db "Hello, World!", 13, 10, 0   ; String with CR, LF, and a null terminator

; Padding and MBR signature
times 510-($-$$) db 0
dw 0AA55h
