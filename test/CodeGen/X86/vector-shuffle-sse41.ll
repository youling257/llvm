; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-- -mattr=+sse4.1 | FileCheck %s --check-prefix=SSE
; RUN: llc < %s -mtriple=x86_64-- -mattr=+avx | FileCheck %s --check-prefix=AVX

define <8 x i16> @blend_packusdw(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> %a2, <4 x i32> %a3) {
; SSE-LABEL: blend_packusdw:
; SSE:       # %bb.0:
; SSE-NEXT:    packusdw %xmm2, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: blend_packusdw:
; AVX:       # %bb.0:
; AVX-NEXT:    vpackusdw %xmm2, %xmm0, %xmm0
; AVX-NEXT:    retq
  %p0 = call <8 x i16> @llvm.x86.sse41.packusdw(<4 x i32> %a0, <4 x i32> %a1)
  %p1 = call <8 x i16> @llvm.x86.sse41.packusdw(<4 x i32> %a2, <4 x i32> %a3)
  %s0 = shufflevector <8 x i16> %p0, <8 x i16> %p1, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11>
  ret <8 x i16> %s0
}

define <16 x i8> @blend_packuswb(<8 x i16> %a0, <8 x i16> %a1, <8 x i16> %a2, <8 x i16> %a3) {
; SSE-LABEL: blend_packuswb:
; SSE:       # %bb.0:
; SSE-NEXT:    packuswb %xmm2, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: blend_packuswb:
; AVX:       # %bb.0:
; AVX-NEXT:    vpackuswb %xmm2, %xmm0, %xmm0
; AVX-NEXT:    retq
  %p0 = call <16 x i8> @llvm.x86.sse2.packuswb.128(<8 x i16> %a0, <8 x i16> %a1)
  %p1 = call <16 x i8> @llvm.x86.sse2.packuswb.128(<8 x i16> %a2, <8 x i16> %a3)
  %s0 = shufflevector <16 x i8> %p0, <16 x i8> %p1, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
  ret <16 x i8> %s0
}

define <8 x i16> @blend_packusdw_packuswb(<4 x i32> %a0, <4 x i32> %a1, <8 x i16> %a2, <8 x i16> %a3) {
; SSE-LABEL: blend_packusdw_packuswb:
; SSE:       # %bb.0:
; SSE-NEXT:    packusdw %xmm0, %xmm0
; SSE-NEXT:    packuswb %xmm2, %xmm2
; SSE-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm2[0]
; SSE-NEXT:    retq
;
; AVX-LABEL: blend_packusdw_packuswb:
; AVX:       # %bb.0:
; AVX-NEXT:    vpackusdw %xmm0, %xmm0, %xmm0
; AVX-NEXT:    vpackuswb %xmm2, %xmm2, %xmm1
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; AVX-NEXT:    retq
  %p0 = call <8 x i16> @llvm.x86.sse41.packusdw(<4 x i32> %a0, <4 x i32> %a1)
  %p1 = call <16 x i8> @llvm.x86.sse2.packuswb.128(<8 x i16> %a2, <8 x i16> %a3)
  %b1 = bitcast <16 x i8> %p1 to <8 x i16>
  %s0 = shufflevector <8 x i16> %p0, <8 x i16> %b1, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11>
  ret <8 x i16> %s0
}

declare <16 x i8> @llvm.x86.sse2.packuswb.128(<8 x i16>, <8 x i16>)
declare <8 x i16> @llvm.x86.sse41.packusdw(<4 x i32>, <4 x i32>)
