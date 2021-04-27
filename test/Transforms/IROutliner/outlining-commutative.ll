; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -verify -iroutliner -ir-outlining-no-cost < %s | FileCheck %s

; This test checks that commutative instructions where the operands are
; swapped are outlined as the same function.

; It also checks that non-commutative instructions outlined as different
; functions when the operands are swapped;

; These are identical functions, except that in the flipped functions,
; the operands in the adds are commuted.  However, since add instructions
; are commutative, we should still outline from all four as the same
; instruction.

define void @outline_from_add1() {
; CHECK-LABEL: @outline_from_add1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    call void @outlined_ir_func_0(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  %0 = add i32 %al, %bl
  %1 = add i32 %al, %cl
  %2 = add i32 %bl, %cl
  ret void
}

define void @outline_from_add2() {
; CHECK-LABEL: @outline_from_add2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    call void @outlined_ir_func_0(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  %0 = add i32 %al, %bl
  %1 = add i32 %al, %cl
  %2 = add i32 %bl, %cl
  ret void
}

define void @outline_from_flipped_add3() {
; CHECK-LABEL: @outline_from_flipped_add3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    call void @outlined_ir_func_0(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  %0 = add i32 %bl, %al
  %1 = add i32 %cl, %al
  %2 = add i32 %cl, %bl
  ret void
}

define void @outline_from_flipped_add4() {
; CHECK-LABEL: @outline_from_flipped_add4(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    call void @outlined_ir_func_0(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  %0 = add i32 %bl, %al
  %1 = add i32 %cl, %al
  %2 = add i32 %cl, %bl
  ret void
}

; These are identical functions, except that in the flipped functions,
; the operands in the subtractions are commuted.  Since subtraction
; instructions are not commutative, we should outline the first two functions
; differently than the second two functions.

define void @outline_from_sub1() {
; CHECK-LABEL: @outline_from_sub1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    call void @outlined_ir_func_2(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  %0 = sub i32 %al, %bl
  %1 = sub i32 %al, %cl
  %2 = sub i32 %bl, %cl
  ret void
}

define void @outline_from_sub2() {
; CHECK-LABEL: @outline_from_sub2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    call void @outlined_ir_func_2(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  %0 = sub i32 %al, %bl
  %1 = sub i32 %al, %cl
  %2 = sub i32 %bl, %cl
  ret void
}

define void @dontoutline_from_flipped_sub3() {
; CHECK-LABEL: @dontoutline_from_flipped_sub3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    call void @outlined_ir_func_1(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  %0 = sub i32 %bl, %al
  %1 = sub i32 %cl, %al
  %2 = sub i32 %cl, %bl
  ret void
}

define void @dontoutline_from_flipped_sub4() {
; CHECK-LABEL: @dontoutline_from_flipped_sub4(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    call void @outlined_ir_func_1(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  %0 = sub i32 %bl, %al
  %1 = sub i32 %cl, %al
  %2 = sub i32 %cl, %bl
  ret void
}

; CHECK: define internal void @outlined_ir_func_0(i32* [[ARG0:%.*]], i32* [[ARG1:%.*]], i32* [[ARG2:%.*]]) #0 {
; CHECK: entry_to_outline:
; CHECK-NEXT:    store i32 2, i32* [[ARG0]], align 4
; CHECK-NEXT:    store i32 3, i32* [[ARG1]], align 4
; CHECK-NEXT:    store i32 4, i32* [[ARG2]], align 4
; CHECK-NEXT:    [[AL:%.*]] = load i32, i32* [[ARG0]], align 4
; CHECK-NEXT:    [[BL:%.*]] = load i32, i32* [[ARG1]], align 4
; CHECK-NEXT:    [[CL:%.*]] = load i32, i32* [[ARG2]], align 4
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[AL]], [[BL]]
; CHECK-NEXT:    [[TMP1:%.*]] = add i32 [[AL]], [[CL]]
; CHECK-NEXT:    [[TMP2:%.*]] = add i32 [[BL]], [[CL]]

; CHECK: define internal void @outlined_ir_func_1(i32* [[ARG0:%.*]], i32* [[ARG1:%.*]], i32* [[ARG2:%.*]]) #0 {
; CHECK: entry_to_outline:
; CHECK-NEXT:    store i32 2, i32* [[ARG0]], align 4
; CHECK-NEXT:    store i32 3, i32* [[ARG1]], align 4
; CHECK-NEXT:    store i32 4, i32* [[ARG2]], align 4
; CHECK-NEXT:    [[AL:%.*]] = load i32, i32* [[ARG0]], align 4
; CHECK-NEXT:    [[BL:%.*]] = load i32, i32* [[ARG1]], align 4
; CHECK-NEXT:    [[CL:%.*]] = load i32, i32* [[ARG2]], align 4
; CHECK-NEXT:    [[TMP0:%.*]] = sub i32 [[BL]], [[AL]]
; CHECK-NEXT:    [[TMP1:%.*]] = sub i32 [[CL]], [[AL]]
; CHECK-NEXT:    [[TMP2:%.*]] = sub i32 [[CL]], [[BL]]

; CHECK: define internal void @outlined_ir_func_2(i32* [[ARG0:%.*]], i32* [[ARG1:%.*]], i32* [[ARG2:%.*]]) #0 {
; CHECK: entry_to_outline:
; CHECK-NEXT:    store i32 2, i32* [[ARG0]], align 4
; CHECK-NEXT:    store i32 3, i32* [[ARG1]], align 4
; CHECK-NEXT:    store i32 4, i32* [[ARG2]], align 4
; CHECK-NEXT:    [[AL:%.*]] = load i32, i32* [[ARG0]], align 4
; CHECK-NEXT:    [[BL:%.*]] = load i32, i32* [[ARG1]], align 4
; CHECK-NEXT:    [[CL:%.*]] = load i32, i32* [[ARG2]], align 4
; CHECK-NEXT:    [[TMP0:%.*]] = sub i32 [[AL]], [[BL]]
; CHECK-NEXT:    [[TMP1:%.*]] = sub i32 [[AL]], [[CL]]
; CHECK-NEXT:    [[TMP2:%.*]] = sub i32 [[BL]], [[CL]]
