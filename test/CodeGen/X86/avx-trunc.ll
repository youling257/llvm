; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx | FileCheck %s

define <4 x i32> @trunc_64_32(<4 x i64> %A) nounwind uwtable readnone ssp{
; CHECK-LABEL: trunc_64_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vextractf128 $1, %ymm0, %xmm1
; CHECK-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,2],xmm1[0,2]
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
  %B = trunc <4 x i64> %A to <4 x i32>
  ret <4 x i32>%B
}

define <8 x i16> @trunc_32_16(<8 x i32> %A) nounwind uwtable readnone ssp{
; CHECK-LABEL: trunc_32_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vextractf128 $1, %ymm0, %xmm1
; CHECK-NEXT:    vmovdqa {{.*#+}} xmm2 = <0,1,4,5,8,9,12,13,u,u,u,u,u,u,u,u>
; CHECK-NEXT:    vpshufb %xmm2, %xmm1, %xmm1
; CHECK-NEXT:    vpshufb %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    vpunpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
  %B = trunc <8 x i32> %A to <8 x i16>
  ret <8 x i16>%B
}

define <16 x i8> @trunc_16_8(<16 x i16> %A) nounwind uwtable readnone ssp{
; CHECK-LABEL: trunc_16_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vandps {{.*}}(%rip), %ymm0, %ymm0
; CHECK-NEXT:    vextractf128 $1, %ymm0, %xmm1
; CHECK-NEXT:    vpackuswb %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
  %B = trunc <16 x i16> %A to <16 x i8>
  ret <16 x i8> %B
}


