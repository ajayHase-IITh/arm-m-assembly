# systick configuration registers
.equ systick_csr,   0xE000E010
.equ systick_rvr,   0xE000E014
.equ systick_cvr,   0xE000E018
.equ systick_calib, 0xE000E01c
.equ timeout,       0x00ffffff


.section .vectors
vector_table:
    .word 0x20001000        // Initial stack pointer value
    .word reset_handler     // Reset handler address
.org 0x3C
    .word systick_handler   // SysTick handler address
    .zero 400               // Space for the rest of the vector table


.section .text
.align 1
.type reset_handler, %function
reset_handler:
    mov r5, #0              // Initialize a counter to 0 (used in ISR)

    ldr r0, =systick_csr    // Load addresses of SysTick registers
    ldr r1, =systick_rvr
    ldr r2, =systick_cvr
    ldr r3, =timeout        // r3 = 0x00ffffff

    str r3, [r1]            // systick_rvr = timeout
    mov r3, #0x0
    str r3, [r2]            // systick_cvr = 0 (clear current value)

    mov r3, #0x7
    str r3, [r0]            // systick_csr = 0x7 (enable SysTick + interrupt)

    b .                     // Infinite loop (wait here, interrupts will occur)


.section .text
.align 1
.type systick_handler, %function
systick_handler:
    add r5, r5, #1       // Increment counter on each SysTick interrupt
break_here:
    bx lr                // Return from interrupt


