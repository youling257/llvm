; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64--linux-gnu -mattr=+sve < %s | FileCheck %s

define <vscale x 2 x i64> @masked_gather_nxv2i8(<vscale x 2 x i8*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1b { z0.d }, p0/z, [z0.d, #1]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i8, <vscale x 2 x i8*> %bases, i32 1
  %vals = call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8(<vscale x 2 x i8*> %ptrs, i32 1, <vscale x 2 x i1> %mask, <vscale x 2 x i8> undef)
  %vals.zext = zext <vscale x 2 x i8> %vals to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %vals.zext
}

define <vscale x 2 x i64> @masked_gather_nxv2i16(<vscale x 2 x i16*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1h { z0.d }, p0/z, [z0.d, #2]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i16, <vscale x 2 x i16*> %bases, i32 1
  %vals = call <vscale x 2 x i16> @llvm.masked.gather.nxv2i16(<vscale x 2 x i16*> %ptrs, i32 2, <vscale x 2 x i1> %mask, <vscale x 2 x i16> undef)
  %vals.zext = zext <vscale x 2 x i16> %vals to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %vals.zext
}

define <vscale x 2 x i64> @masked_gather_nxv2i32(<vscale x 2 x i32*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1w { z0.d }, p0/z, [z0.d, #4]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i32, <vscale x 2 x i32*> %bases, i32 1
  %vals = call <vscale x 2 x i32> @llvm.masked.gather.nxv2i32(<vscale x 2 x i32*> %ptrs, i32 4, <vscale x 2 x i1> %mask, <vscale x 2 x i32> undef)
  %vals.zext = zext <vscale x 2 x i32> %vals to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %vals.zext
}

define <vscale x 2 x i64> @masked_gather_nxv2i64(<vscale x 2 x i64*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1d { z0.d }, p0/z, [z0.d, #8]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i64, <vscale x 2 x i64*> %bases, i32 1
  %vals.zext = call <vscale x 2 x i64> @llvm.masked.gather.nxv2i64(<vscale x 2 x i64*> %ptrs, i32 8, <vscale x 2 x i1> %mask, <vscale x 2 x i64> undef)
  ret <vscale x 2 x i64> %vals.zext
}

define <vscale x 2 x half> @masked_gather_nxv2f16(<vscale x 2 x half*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1h { z0.d }, p0/z, [z0.d, #4]
; CHECK-NEXT:    ret
  %ptrs = getelementptr half, <vscale x 2 x half*> %bases, i32 2
  %vals = call <vscale x 2 x half> @llvm.masked.gather.nxv2f16(<vscale x 2 x half*> %ptrs, i32 2, <vscale x 2 x i1> %mask, <vscale x 2 x half> undef)
  ret <vscale x 2 x half> %vals
}

define <vscale x 2 x bfloat> @masked_gather_nxv2bf16(<vscale x 2 x bfloat*> %bases, <vscale x 2 x i1> %mask) #0 {
; CHECK-LABEL: masked_gather_nxv2bf16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1h { z0.d }, p0/z, [z0.d, #4]
; CHECK-NEXT:    ret
  %ptrs = getelementptr bfloat, <vscale x 2 x bfloat*> %bases, i32 2
  %vals = call <vscale x 2 x bfloat> @llvm.masked.gather.nxv2bf16(<vscale x 2 x bfloat*> %ptrs, i32 2, <vscale x 2 x i1> %mask, <vscale x 2 x bfloat> undef)
  ret <vscale x 2 x bfloat> %vals
}

define <vscale x 2 x float> @masked_gather_nxv2f32(<vscale x 2 x float*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1w { z0.d }, p0/z, [z0.d, #12]
; CHECK-NEXT:    ret
  %ptrs = getelementptr float, <vscale x 2 x float*> %bases, i32 3
  %vals = call <vscale x 2 x float> @llvm.masked.gather.nxv2f32(<vscale x 2 x float*> %ptrs, i32 4, <vscale x 2 x i1> %mask, <vscale x 2 x float> undef)
  ret <vscale x 2 x float> %vals
}

define <vscale x 2 x double> @masked_gather_nxv2f64(<vscale x 2 x double*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1d { z0.d }, p0/z, [z0.d, #32]
; CHECK-NEXT:    ret
  %ptrs = getelementptr double, <vscale x 2 x double*> %bases, i32 4
  %vals = call <vscale x 2 x double> @llvm.masked.gather.nxv2f64(<vscale x 2 x double*> %ptrs, i32 8, <vscale x 2 x i1> %mask, <vscale x 2 x double> undef)
  ret <vscale x 2 x double> %vals
}

define <vscale x 2 x i64> @masked_sgather_nxv2i8(<vscale x 2 x i8*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_sgather_nxv2i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1sb { z0.d }, p0/z, [z0.d, #5]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i8, <vscale x 2 x i8*> %bases, i32 5
  %vals = call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8(<vscale x 2 x i8*> %ptrs, i32 1, <vscale x 2 x i1> %mask, <vscale x 2 x i8> undef)
  %vals.sext = sext <vscale x 2 x i8> %vals to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %vals.sext
}

define <vscale x 2 x i64> @masked_sgather_nxv2i16(<vscale x 2 x i16*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_sgather_nxv2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1sh { z0.d }, p0/z, [z0.d, #12]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i16, <vscale x 2 x i16*> %bases, i32 6
  %vals = call <vscale x 2 x i16> @llvm.masked.gather.nxv2i16(<vscale x 2 x i16*> %ptrs, i32 2, <vscale x 2 x i1> %mask, <vscale x 2 x i16> undef)
  %vals.sext = sext <vscale x 2 x i16> %vals to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %vals.sext
}

define <vscale x 2 x i64> @masked_sgather_nxv2i32(<vscale x 2 x i32*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_sgather_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1sw { z0.d }, p0/z, [z0.d, #28]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i32, <vscale x 2 x i32*> %bases, i32 7
  %vals = call <vscale x 2 x i32> @llvm.masked.gather.nxv2i32(<vscale x 2 x i32*> %ptrs, i32 4, <vscale x 2 x i1> %mask, <vscale x 2 x i32> undef)
  %vals.sext = sext <vscale x 2 x i32> %vals to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %vals.sext
}

; Tests where the immediate is out of range

define <vscale x 2 x i64> @masked_gather_nxv2i8_range(<vscale x 2 x i8*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2i8_range:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w8, #32
; CHECK-NEXT:    ld1b { z0.d }, p0/z, [x8, z0.d]
; CHECK-NEXT:    ret
  %ptrs = getelementptr i8, <vscale x 2 x i8*> %bases, i32 32
  %vals = call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8(<vscale x 2 x i8*> %ptrs, i32 1, <vscale x 2 x i1> %mask, <vscale x 2 x i8> undef)
  %vals.zext = zext <vscale x 2 x i8> %vals to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %vals.zext
}

define <vscale x 2 x half> @masked_gather_nxv2f16_range(<vscale x 2 x half*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2f16_range:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w8, #64
; CHECK-NEXT:    ld1h { z0.d }, p0/z, [x8, z0.d]
; CHECK-NEXT:    ret
  %ptrs = getelementptr half, <vscale x 2 x half*> %bases, i32 32
  %vals = call <vscale x 2 x half> @llvm.masked.gather.nxv2f16(<vscale x 2 x half*> %ptrs, i32 2, <vscale x 2 x i1> %mask, <vscale x 2 x half> undef)
  ret <vscale x 2 x half> %vals
}

define <vscale x 2 x bfloat> @masked_gather_nxv2bf16_range(<vscale x 2 x bfloat*> %bases, <vscale x 2 x i1> %mask) #0 {
; CHECK-LABEL: masked_gather_nxv2bf16_range:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w8, #64
; CHECK-NEXT:    ld1h { z0.d }, p0/z, [x8, z0.d]
; CHECK-NEXT:    ret
  %ptrs = getelementptr bfloat, <vscale x 2 x bfloat*> %bases, i32 32
  %vals = call <vscale x 2 x bfloat> @llvm.masked.gather.nxv2bf16(<vscale x 2 x bfloat*> %ptrs, i32 2, <vscale x 2 x i1> %mask, <vscale x 2 x bfloat> undef)
  ret <vscale x 2 x bfloat> %vals
}

define <vscale x 2 x float> @masked_gather_nxv2f32_range(<vscale x 2 x float*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2f32_range:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w8, #128
; CHECK-NEXT:    ld1w { z0.d }, p0/z, [x8, z0.d]
; CHECK-NEXT:    ret
  %ptrs = getelementptr float, <vscale x 2 x float*> %bases, i32 32
  %vals = call <vscale x 2 x float> @llvm.masked.gather.nxv2f32(<vscale x 2 x float*> %ptrs, i32 4, <vscale x 2 x i1> %mask, <vscale x 2 x float> undef)
  ret <vscale x 2 x float> %vals
}

define <vscale x 2 x double> @masked_gather_nxv2f64_range(<vscale x 2 x double*> %bases, <vscale x 2 x i1> %mask) {
; CHECK-LABEL: masked_gather_nxv2f64_range:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w8, #256
; CHECK-NEXT:    ld1d { z0.d }, p0/z, [x8, z0.d]
; CHECK-NEXT:    ret
  %ptrs = getelementptr double, <vscale x 2 x double*> %bases, i32 32
  %vals = call <vscale x 2 x double> @llvm.masked.gather.nxv2f64(<vscale x 2 x double*> %ptrs, i32 8, <vscale x 2 x i1> %mask, <vscale x 2 x double> undef)
  ret <vscale x 2 x double> %vals
}

declare <vscale x 2 x i8> @llvm.masked.gather.nxv2i8(<vscale x 2 x i8*>, i32, <vscale x 2 x i1>, <vscale x 2 x i8>)
declare <vscale x 2 x i16> @llvm.masked.gather.nxv2i16(<vscale x 2 x i16*>, i32, <vscale x 2 x i1>, <vscale x 2 x i16>)
declare <vscale x 2 x i32> @llvm.masked.gather.nxv2i32(<vscale x 2 x i32*>, i32, <vscale x 2 x i1>, <vscale x 2 x i32>)
declare <vscale x 2 x i64> @llvm.masked.gather.nxv2i64(<vscale x 2 x i64*>, i32, <vscale x 2 x i1>, <vscale x 2 x i64>)
declare <vscale x 2 x half> @llvm.masked.gather.nxv2f16(<vscale x 2 x half*>, i32, <vscale x 2 x i1>, <vscale x 2 x half>)
declare <vscale x 2 x bfloat> @llvm.masked.gather.nxv2bf16(<vscale x 2 x bfloat*>, i32, <vscale x 2 x i1>, <vscale x 2 x bfloat>)
declare <vscale x 2 x float> @llvm.masked.gather.nxv2f32(<vscale x 2 x float*>, i32, <vscale x 2 x i1>, <vscale x 2 x float>)
declare <vscale x 2 x double> @llvm.masked.gather.nxv2f64(<vscale x 2 x double*>, i32, <vscale x 2 x i1>, <vscale x 2 x double>)
attributes #0 = { "target-features"="+sve,+bf16" }
