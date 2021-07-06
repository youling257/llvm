; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -instcombine < %s | FileCheck %s

; A copy of fmul.ll, with undef at insertelement/shufflevector replaced with
; poison

; Don't crash when attempting to cast a constant FMul to an instruction.
define void @test8(i32* %inout) {
; CHECK-LABEL: @test8(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_COND:%.*]]
; CHECK:       for.cond:
; CHECK-NEXT:    [[LOCAL_VAR_7_0:%.*]] = phi <4 x float> [ <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, [[ENTRY:%.*]] ], [ [[TMP0:%.*]], [[FOR_BODY:%.*]] ]
; CHECK-NEXT:    br i1 undef, label [[FOR_BODY]], label [[FOR_END:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[TMP0]] = insertelement <4 x float> [[LOCAL_VAR_7_0]], float 0.000000e+00, i32 2
; CHECK-NEXT:    br label [[FOR_COND]]
; CHECK:       for.end:
; CHECK-NEXT:    ret void
;
entry:
  %0 = load i32, i32* %inout, align 4
  %conv = uitofp i32 %0 to float
  %vecinit = insertelement <4 x float> <float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float undef>, float %conv, i32 3
  %sub = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %vecinit
  %1 = shufflevector <4 x float> %sub, <4 x float> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = fmul <4 x float> zeroinitializer, %1
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %local_var_7.0 = phi <4 x float> [ %mul, %entry ], [ %2, %for.body ]
  br i1 undef, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = insertelement <4 x float> %local_var_7.0, float 0.000000e+00, i32 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}


; fastmath => z * splat(0) = splat(0), even for scalable vectors
define <vscale x 2 x float> @mul_scalable_splat_zero(<vscale x 2 x float> %z) {
; CHECK-LABEL: @mul_scalable_splat_zero(
; CHECK-NEXT:    ret <vscale x 2 x float> zeroinitializer
;
  %shuf = shufflevector <vscale x 2 x float> insertelement (<vscale x 2 x float> undef, float 0.0, i32 0), <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %t3 = fmul fast <vscale x 2 x float> %shuf, %z
  ret <vscale x 2 x float> %t3
}
