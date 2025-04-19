
ORG 0x7C00
BITS 16

START:
    CLI                   ; BLOCK INTERRUPTS
    XOR AX, AX
    MOV DS, AX
    MOV ES, AX
    MOV SS, AX
    MOV BL, 0x07
    MOV SP, 0x7C00
    MOV DI, 0x09*4        ; IVT PLACE
    MOV WORD [DI], DRIVER ; IRQ1 SETUP
    MOV WORD [DI + 2], CS ; IRQ1 SETUP
    STI                   ; UNBLOCK INTERRUPTS

LOOP:
    JMP LOOP

DRIVER:
    PUSHA
    XOR AX, AX
    IN AL, 0x60         ; KEYBOARD I/O PORT
    CALL SCODE_TO_ASCII ; CONVERSION   

    MOV AH, 0x0E        ; BIOS TELETYPE function (print character)
    INT 0x10            ; Calls BIOS to print character in AL
    
    MOV AL, 0x20        ; END OF INTERRUPT
    OUT 0x20, AL        ; SEND EOI TO PIC
    POPA
    IRET

SCODE_TO_ASCII:
    CMP AL, 0x1E    
    JE A

    CMP AL, 0x30    
    JE B

    CMP AL, 0x2E    
    JE C

    CMP AL, 0x20    
    JE D

    CMP AL, 0x12    
    JE E

    CMP AL, 0x21    
    JE F

    CMP AL, 0x22    
    JE G

    CMP AL, 0x23    
    JE H

    CMP AL, 0x17    
    JE I

    CMP AL, 0x24    
    JE J

    CMP AL, 0x25    
    JE K

    CMP AL, 0x26    
    JE L

    CMP AL, 0x32    
    JE M

    CMP AL, 0x31    
    JE N

    CMP AL, 0x18    
    JE O

    CMP AL, 0x19    
    JE P

    CMP AL, 0x10    
    JE Q

    CMP AL, 0x13    
    JE R

    CMP AL, 0x1F    
    JE S

    CMP AL, 0x14    
    JE T

    CMP AL, 0x16    
    JE U

    CMP AL, 0x2F    
    JE V

    CMP AL, 0x11    
    JE W

    CMP AL, 0x2D    
    JE X

    CMP AL, 0x15    
    JE Y

    CMP AL, 0x2C    
    JE Z
    
    XOR AH, AH          
    RET

A:
    MOV AL, 'A'
    RET

B:
    MOV AL, 'B'
    RET

C:
    MOV AL, 'C'
    RET

D:
    MOV AL, 'D'
    RET

E:
    MOV AL, 'E'
    RET

F:
    MOV AL, 'F'
    RET

G:
    MOV AL, 'G'
    RET

H:
    MOV AL, 'H'
    RET

I:
    MOV AL, 'I'
    RET

J:
    MOV AL, 'J'
    RET

K:
    MOV AL, 'K'
    RET

L:
    MOV AL, 'L'
    RET

M:
    MOV AL, 'M'
    RET

N:
    MOV AL, 'N'
    RET

O:
    MOV AL, 'O'
    RET

P:
    MOV AL, 'P'
    RET

Q:
    MOV AL, 'Q'
    RET

R:
    MOV AL, 'R'
    RET

S:
    MOV AL, 'S'
    RET

T:
    MOV AL, 'T'
    RET

U:
    MOV AL, 'U'
    RET

V:
    MOV AL, 'V'
    RET

W:
    MOV AL, 'W'
    RET

X:
    MOV AL, 'X'
    RET

Y:
    MOV AL, 'Y'
    RET

Z:
    MOV AL, 'Z'
    RET

; BOOTLOADER
TIMES 510 - ($ - $$) db 0
DW 0xAA55
