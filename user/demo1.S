        .globl main
# sum_to(n)
# expects argument in a0
# returns result in a0
sum_to:
        mv t0, a0          # t0 <- a0
        li a0, 0           # a0 <- 0
loop:
        add a0, a0, t0     # a0 <- a0 + t0
        addi t0, t0, -1    # t0 <- t0 - 1
        bnez t0, loop      # if t0 != 0: pc <- loop
ret

main:
        li a0, 10          # a0 <- 10
        call sum_to

        mv a1, a0            # arg1 = result
        la a0, fmt           # arg0 = format string
        call printf

        li a0, 0
        call exit

        .section .rodata
fmt:
        .string "sum_to(10) = %d\n"
