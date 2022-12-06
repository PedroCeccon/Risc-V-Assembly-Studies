
#Nome: Pedro Henrique Peracoli Pereira Ceccon
#RA: 247327
#Turma: MC404 B

.set gpt, 0xffff0100
.set self_driving_car, 0xffff0300
.set serial_port, 0xffff0500
.set canvas, 0xffff0700

.set set_engine_and_steering_id, 10
.set set_handbrek_id, 11
.set read_sensors_id, 12
.set read_sensor_distance_id, 13
.set get_position_id, 15
.set get_rotation_id, 16
.set read_id, 17
.set write_id, 18
.set draw_line_id, 19
.set get_systime_id, 20

.bss
.align 4

systemStack: .skip 32
systemStack_end:

.text
.align 4

Syscall_set_engine_and_steering:
    li t0, 1
    bgt a0, t0, 1f
    li t0, -1
    blt a0, t0, 1f
    li t0, 127
    bgt a1, t0, 1f
    li t0, -127
    blt a1, t0, 1f
    li t0, self_driving_car
    sb zero, 0x22(t0)
    sb a0, 0x21(t0)
    sb a1, 0x20(t0)
    li a0, 0
    j return_syscall
    1:
    li a0, -1
    j return_syscall

Syscall_set_handbreak:
    li t0, 1
    beq a0, t0, 1f
    beq a0, zero, 1f
    li a0, -1
    j return_syscall
    1:
    li t0, self_driving_car
    sb a0, 0x22(t0)
    li a0, 0
    j return_syscall

Syscall_read_sensors:
    li t0, self_driving_car
    li t1, 1
    sb t1, 1(t0)
    1:
    lb t1, 1(t0)
    bne t1, zero, 1b
    addi t0, t0, 24
    add t1, t0, 256
    1:
        lb a1, 0(t0)
        sb a1, 0(a0)
        addi t0, t0, 1
        addi a0, a0, 1
        blt t0, t1, 1b
    j return_syscall

Syscall_read_sensor_distance:
    li t0, self_driving_car
    li t1, 1
    sb t1, 2(t0)
    1:
    lb t1, 2(t0)
    bne t1, zero, 1b
    lw a0, 0x1c(t0)
    li t0, self_driving_car
    li t1, 2
    sb t1, 2(t0)
    1:
    lb t1, 2(t0)
    bne t1, zero, 1b
    lw a1, 0x1c(t0)
    li t0, self_driving_car
    li t1, 3
    sb t1, 2(t0)
    1:
    lb t1, 2(t0)
    bne t1, zero, 1b
    lw a2, 0x1c(t0)
    j return_syscall

Syscall_get_position:
    li t0, self_driving_car
    li t1, 1
    sb t1, 0(t0)
    1:
    lb t1, 0(t0)
    bne t1, zero, 1b
    lw a0, 0x10(t0)
    lw a1, 0x14(t0)
    lw a2, 0x18(t0)
    j return_syscall

Syscall_get_rotation:
    li t0, self_driving_car
    li t1, 1
    sb t1, 0(t0)
    1:
    lb t1, 0(t0)
    bne t1, zero, 1b
    sb t1, 0(t0)
    lw a0, 0x04(t0)
    lw a1, 0x08(t0)
    lw a2, 0x0c(t0)
    j return_syscall
    
Syscall_read:
    mv t3, a1
    bne a0, zero, return_syscall
    li a0, 0
    li t0, serial_port
    li t2, 10
    1:
    li t1, 1
    sb t1, 2(t0)
    2:
    lb t1, 2(t0)
    bnez t1, 2b
    lb t1, 3(t0)
    beqz t1, 1b
    sb t1, 0(t3)
    addi t3, t3, 1
    addi a0, a0, 1
    1:
    beq a0, a2, return_syscall
    li t1, 1
    sb t1, 2(t0)
    2:
    lb t1, 2(t0)
    bnez t1, 2b
    lb t1, 3(t0)
    beqz t1, return_syscall 
    addi a0, a0, 1
    sb t1, 0(t3)
    addi t3, t3, 1
    j 1b    

Syscall_write:
    mv t3, a1
    li t1, 1
    bne a0, t1, return_syscall
    li t0, serial_port
    li a0, 0
    1:
    lb t1, 0(t3)
    addi t3, t3, 1
    sb t1, 1(t0)
    li t1, 1
    sb t1, 0(t0)
    2:
    lb t1, 0(t0)
    bnez t1, 2b
    addi a0, a0, 1
    bne a0, a2, 1b
    j return_syscall


Syscall_draw_line:
    li t0, canvas
    li t1, 400
    sh t1, 2(t0)
    sw zero, 4(t0)
    addi t1, t0, 8
    addi t2, t1, 400
    1:
    lbu t2, 0(a0)
    addi a0, a0, 1
    li t3, 255
    slli t3, t3, 8
    add t3, t3, t2
    slli t3, t3, 8
    add t3, t3, t2
    slli t3, t3, 8
    add t3, t3, t2
    sw t3, 0(t1)
    addi t1, t1, 4
    blt t1, t2, 1b
    li t1, 1
    sb t1, 0(t0)
    2:
    lb t1, 0(t0)
    bnez t1, 2b
    li t1, 400
    sh t1, 2(t0)
    li t1, 100
    sw t1, 4(t0)
    addi t1, t0, 8
    addi t2, t1, 400
    1:
    lbu t2, 0(a0)
    addi a0, a0, 1
    li t3, 255
    slli t3, t3, 8
    add t3, t3, t2
    slli t3, t3, 8
    add t3, t3, t2
    slli t3, t3, 8
    add t3, t3, t2
    sw t3, 0(t1)
    addi t1, t1, 4
    blt t1, t2, 1b
    li t1, 1
    sb t1, 0(t0)
    2:
    lb t1, 0(t0)
    bnez t1, 2b
    li t1, 224
    sh t1, 2(t0)
    li t1, 200
    sw t1, 4(t0)
    addi t1, t0, 8
    addi t2, t1, 224
    1:
    lbu t2, 0(a0)
    addi a0, a0, 1
    li t3, 255
    slli t3, t3, 8
    add t3, t3, t2
    slli t3, t3, 8
    add t3, t3, t2
    slli t3, t3, 8
    add t3, t3, t2
    sw t3, 0(t1)
    addi t1, t1, 4
    blt t1, t2, 1b
    li t1, 1
    sb t1, 0(t0)
    2:
    lb t1, 0(t0)
    bnez t1, 2b
    j return_syscall


Syscall_get_systime:
    li t0, gpt
    li t1, 1
    sb t1, 0(t0)
    1:
    lb t1, 0(t0)
    bne t1, zero, 1b
    lw a0, 4(t0)
    j return_syscall

int_handler:
  ###### Tratador de interrupções e syscalls ######
    csrrw sp, mscratch, sp
    addi sp, sp, -32  
    sw t0, 0(sp) 
    sw t1, 4(sp)
    sw t2, 8(sp)
    sw t3, 12(sp)
    sw ra, 16(sp)
  
  # <= Implemente o tratamento da sua syscall aqui
    li t0, set_engine_and_steering_id
    beq a7, t0, Syscall_set_engine_and_steering
    li t0, set_handbrek_id
    beq a7, t0, Syscall_set_handbreak
    li t0, read_sensors_id
    beq a7, t0, Syscall_read_sensors
    li t0, read_sensor_distance_id
    beq a7, t0, Syscall_read_sensor_distance
    li t0, get_position_id
    beq a7, t0, Syscall_get_position
    li t0, get_rotation_id
    beq a7, t0, Syscall_get_rotation
    li t0, read_id
    beq a7, t0, Syscall_read
    li t0, write_id
    beq a7, t0, Syscall_write
    li t0, draw_line_id
    beq a7, t0, Syscall_draw_line
    li t0, get_systime_id
    beq a7, t0, Syscall_get_systime
    return_syscall:

    csrr t0, mepc   
    addi t0, t0, 4 
    csrw mepc, t0  

    lw ra, 16(sp)
    lw t3, 12(sp)
    lw t2, 8(sp)
    lw t1, 4(sp)
    lw t0, 0(sp)
    addi sp, sp, 32
    csrrw sp, mscratch, sp 
    mret            # Recuperar o restante do contexto (pc <- mepc)
  


.globl _start
_start:
    li sp, 0x07FFFFFC

    la t0, int_handler
    csrw mtvec, t0

    la t0, systemStack_end
    csrw mscratch, t0


    csrr t1, mstatus 
    ori t1, t1, 0x8 
    csrw mstatus, t1

    csrr t1, mstatus
    li t2, ~0x1800
    and t1, t1, t2
    csrw mstatus, t1

    la t0, main
    csrw mepc, t0

    mret 