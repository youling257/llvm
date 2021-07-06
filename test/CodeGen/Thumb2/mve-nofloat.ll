; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main-none-eabi -mattr=+mve,-vfp2 -o - %s | FileCheck %s --check-prefix=CHECK-NOFP
; RUN: llc -mtriple=thumbv8.1m.main-none-eabi -mattr=+mve.fp -o - %s | FileCheck --check-prefix=CHECK-FP %s

; This file tests tests that we expand floating point operations correctly,
; even if we do not have an fpu.

define arm_aapcs_vfpcc <8 x half> @vector_add_f16(<8 x half> %lhs, <8 x half> %rhs) {
; CHECK-NOFP-LABEL: vector_add_f16:
; CHECK-NOFP:       @ %bb.0: @ %entry
; CHECK-NOFP-NEXT:    .save {r4, lr}
; CHECK-NOFP-NEXT:    push {r4, lr}
; CHECK-NOFP-NEXT:    .vsave {d8, d9, d10, d11, d12, d13}
; CHECK-NOFP-NEXT:    vpush {d8, d9, d10, d11, d12, d13}
; CHECK-NOFP-NEXT:    vmov.u16 r0, q1[0]
; CHECK-NOFP-NEXT:    vmov q5, q1
; CHECK-NOFP-NEXT:    vmov q4, q0
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r4, r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q4[0]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r1, r4
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    bl __aeabi_f2h
; CHECK-NOFP-NEXT:    vmov.16 q6[0], r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q5[1]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r4, r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q4[1]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r1, r4
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    bl __aeabi_f2h
; CHECK-NOFP-NEXT:    vmov.16 q6[1], r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q5[2]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r4, r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q4[2]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r1, r4
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    bl __aeabi_f2h
; CHECK-NOFP-NEXT:    vmov.16 q6[2], r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q5[3]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r4, r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q4[3]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r1, r4
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    bl __aeabi_f2h
; CHECK-NOFP-NEXT:    vmov.16 q6[3], r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q5[4]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r4, r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q4[4]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r1, r4
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    bl __aeabi_f2h
; CHECK-NOFP-NEXT:    vmov.16 q6[4], r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q5[5]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r4, r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q4[5]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r1, r4
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    bl __aeabi_f2h
; CHECK-NOFP-NEXT:    vmov.16 q6[5], r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q5[6]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r4, r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q4[6]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r1, r4
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    bl __aeabi_f2h
; CHECK-NOFP-NEXT:    vmov.16 q6[6], r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q5[7]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r4, r0
; CHECK-NOFP-NEXT:    vmov.u16 r0, q4[7]
; CHECK-NOFP-NEXT:    bl __aeabi_h2f
; CHECK-NOFP-NEXT:    mov r1, r4
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    bl __aeabi_f2h
; CHECK-NOFP-NEXT:    vmov.16 q6[7], r0
; CHECK-NOFP-NEXT:    vmov q0, q6
; CHECK-NOFP-NEXT:    vpop {d8, d9, d10, d11, d12, d13}
; CHECK-NOFP-NEXT:    pop {r4, pc}
;
; CHECK-FP-LABEL: vector_add_f16:
; CHECK-FP:       @ %bb.0: @ %entry
; CHECK-FP-NEXT:    vadd.f16 q0, q0, q1
; CHECK-FP-NEXT:    bx lr
entry:
  %sum = fadd <8 x half> %lhs, %rhs
  ret <8 x half> %sum
}

define arm_aapcs_vfpcc <4 x float> @vector_add_f32(<4 x float> %lhs, <4 x float> %rhs) {
; CHECK-NOFP-LABEL: vector_add_f32:
; CHECK-NOFP:       @ %bb.0: @ %entry
; CHECK-NOFP-NEXT:    .save {r7, lr}
; CHECK-NOFP-NEXT:    push {r7, lr}
; CHECK-NOFP-NEXT:    .vsave {d8, d9, d10, d11, d12, d13}
; CHECK-NOFP-NEXT:    vpush {d8, d9, d10, d11, d12, d13}
; CHECK-NOFP-NEXT:    vmov q4, q1
; CHECK-NOFP-NEXT:    vmov q6, q0
; CHECK-NOFP-NEXT:    vmov r0, s27
; CHECK-NOFP-NEXT:    vmov r1, s19
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    vmov s23, r0
; CHECK-NOFP-NEXT:    vmov r0, s26
; CHECK-NOFP-NEXT:    vmov r1, s18
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    vmov s22, r0
; CHECK-NOFP-NEXT:    vmov r0, s25
; CHECK-NOFP-NEXT:    vmov r1, s17
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    vmov s21, r0
; CHECK-NOFP-NEXT:    vmov r0, s24
; CHECK-NOFP-NEXT:    vmov r1, s16
; CHECK-NOFP-NEXT:    bl __aeabi_fadd
; CHECK-NOFP-NEXT:    vmov s20, r0
; CHECK-NOFP-NEXT:    vmov q0, q5
; CHECK-NOFP-NEXT:    vpop {d8, d9, d10, d11, d12, d13}
; CHECK-NOFP-NEXT:    pop {r7, pc}
;
; CHECK-FP-LABEL: vector_add_f32:
; CHECK-FP:       @ %bb.0: @ %entry
; CHECK-FP-NEXT:    vadd.f32 q0, q0, q1
; CHECK-FP-NEXT:    bx lr
entry:
  %sum = fadd <4 x float> %lhs, %rhs
  ret <4 x float> %sum
}

