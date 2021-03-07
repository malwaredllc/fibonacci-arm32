# file: fib.s

.include "macros.inc"

  SET_TARGET

  .text

  FUNCTION main,global

    push {r4,r5,r6,r7,lr}

    ldr r1,=#1         // base case: n=1 -> 1
    ldr r2,=#1         // base case: n=2 -> 1
    ldr r3,=#5         // n-th fibonacci number
    ldr r4,=#3         // iteration counter, start at 3 since first 2 are base cases
    and r5,r5,#0       // clear r5 for output

    LOOP:
      add r5,r2,r1  // f(n) = f(n-1) + f(n-2)
      mov r1,r2     // update n-2 with value of n-1
      mov r2,r5     // update n-1 with value of n
      cmp r4,r3     // check loop count
      beq all_done  // end loop if at iteration

    add r4,r4,#1  // increment iteration counter
    cmp r4,r3     // check if we are done
    ble LOOP      // loop if not finished
    

    all_done:
      mov r1,r5       // move output to r1 for printing
      //ldr r1,[r1]
      svc 0
    
    pop {r4,r5,r6,r7,lr}

    bx lr
  
ENDFUNC main

.data

n:
  .word 5

.end
