; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -ipsccp -S %s | FileCheck %s

;Test for PR45185.

define void @spam([4 x [24 x float]]* %arg) {
; CHECK-LABEL: @spam(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[TMP:%.*]] = getelementptr inbounds [4 x [24 x float]], [4 x [24 x float]]* [[ARG:%.*]], i64 0, i64 0, i64 0
; CHECK-NEXT:    call void @blam(i32 0, float* nonnull [[TMP]])
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds [4 x [24 x float]], [4 x [24 x float]]* [[ARG]], i64 0, i64 1, i64 0
; CHECK-NEXT:    call void @blam(i32 1, float* nonnull [[TMP1]])
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds [4 x [24 x float]], [4 x [24 x float]]* [[ARG]], i64 0, i64 2, i64 0
; CHECK-NEXT:    call void @blam(i32 2, float* nonnull [[TMP2]])
; CHECK-NEXT:    ret void
;
bb:
  %tmp = getelementptr inbounds [4 x [24 x float]], [4 x [24 x float]]* %arg, i64 0, i64 0, i64 0
  call void @blam(i32 0, float* nonnull %tmp)
  %tmp1 = getelementptr inbounds [4 x [24 x float]], [4 x [24 x float]]* %arg, i64 0, i64 1, i64 0
  call void @blam(i32 1, float* nonnull %tmp1)
  %tmp2 = getelementptr inbounds [4 x [24 x float]], [4 x [24 x float]]* %arg, i64 0, i64 2, i64 0
  call void @blam(i32 2, float* nonnull %tmp2)
  ret void
}

; Make sure we do not incorrectly eliminate the checks in @blam.
define internal void @blam(i32 %arg, float* nocapture %arg1) {
; CHECK-LABEL: define {{.*}} @blam(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[TMP:%.*]] = icmp eq i32 [[ARG:%.*]], 0
; CHECK-NEXT:    br i1 [[TMP]], label [[BB2:%.*]], label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    br label [[BB5:%.*]]
; CHECK:       bb3:
; CHECK-NEXT:    [[TMP4:%.*]] = icmp eq i32 [[ARG]], 2
; CHECK-NEXT:    br i1 [[TMP4]], label [[BB5]], label [[BB6:%.*]]
; CHECK:       bb5:
; CHECK-NEXT:    ret void
; CHECK:       bb6:
; CHECK-NEXT:    ret void
;
bb:
  %tmp = icmp eq i32 %arg, 0
  br i1 %tmp, label %bb2, label %bb3

bb2:                                              ; preds = %bb
  br label %bb5

bb3:                                              ; preds = %bb
  %tmp4 = icmp eq i32 %arg, 2
  br i1 %tmp4, label %bb5, label %bb6

bb5:                                              ; preds = %bb3, %bb2
  ret void

bb6:                                              ; preds = %bb3
  ret void
}
