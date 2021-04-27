; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   -mcpu=pwr10 -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr < %s | \
; RUN:   FileCheck %s

; This test case aims to test vector sign extend builtins.

declare <4 x i32> @llvm.ppc.altivec.vextsb2w(<16 x i8>) nounwind readnone
declare <2 x i64> @llvm.ppc.altivec.vextsb2d(<16 x i8>) nounwind readnone
declare <4 x i32> @llvm.ppc.altivec.vextsh2w(<8 x i16>) nounwind readnone
declare <2 x i64> @llvm.ppc.altivec.vextsh2d(<8 x i16>) nounwind readnone
declare <2 x i64> @llvm.ppc.altivec.vextsw2d(<4 x i32>) nounwind readnone

define <4 x i32> @test_vextsb2w(<16 x i8> %x) nounwind readnone {
; CHECK-LABEL: test_vextsb2w:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vextsb2w v2, v2
; CHECK-NEXT:    blr
  %tmp = tail call <4 x i32> @llvm.ppc.altivec.vextsb2w(<16 x i8> %x)
  ret <4 x i32> %tmp
}

define <2 x i64> @test_vextsb2d(<16 x i8> %x) nounwind readnone {
; CHECK-LABEL: test_vextsb2d:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vextsb2d v2, v2
; CHECK-NEXT:    blr
  %tmp = tail call <2 x i64> @llvm.ppc.altivec.vextsb2d(<16 x i8> %x)
  ret <2 x i64> %tmp
}

define <4 x i32> @test_vextsh2w(<8 x i16> %x) nounwind readnone {
; CHECK-LABEL: test_vextsh2w:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vextsh2w v2, v2
; CHECK-NEXT:    blr
  %tmp = tail call <4 x i32> @llvm.ppc.altivec.vextsh2w(<8 x i16> %x)
  ret <4 x i32> %tmp
}

define <2 x i64> @test_vextsh2d(<8 x i16> %x) nounwind readnone {
; CHECK-LABEL: test_vextsh2d:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vextsh2d v2, v2
; CHECK-NEXT:    blr
  %tmp = tail call <2 x i64> @llvm.ppc.altivec.vextsh2d(<8 x i16> %x)
  ret <2 x i64> %tmp
}

define <2 x i64> @test_vextsw2d(<4 x i32> %x) nounwind readnone {
; CHECK-LABEL: test_vextsw2d:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vextsw2d v2, v2
; CHECK-NEXT:    blr
  %tmp = tail call <2 x i64> @llvm.ppc.altivec.vextsw2d(<4 x i32> %x)
  ret <2 x i64> %tmp
}
