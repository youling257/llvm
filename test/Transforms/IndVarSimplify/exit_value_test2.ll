; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; PR23538
; RUN: opt < %s -indvars -loop-deletion -S | FileCheck %s

; Check IndVarSimplify should not replace exit value because or else
; udiv will be introduced by expand and the cost will be high.

declare void @_Z3mixRjj(i32* dereferenceable(4), i32)
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture)
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture)

define i32 @_Z3fooPKcjj(i8* nocapture readonly %s, i32 %len, i32 %c) {
; CHECK-LABEL: @_Z3fooPKcjj(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[T:%.*]] = bitcast i32* [[A]] to i8*
; CHECK-NEXT:    call void @llvm.lifetime.start.p0i8(i64 4, i8* [[T]])
; CHECK-NEXT:    store i32 -1640531527, i32* [[A]], align 4
; CHECK-NEXT:    [[CMP8:%.*]] = icmp ugt i32 [[LEN:%.*]], 11
; CHECK-NEXT:    br i1 [[CMP8]], label [[WHILE_BODY_LR_PH:%.*]], label [[WHILE_END:%.*]]
; CHECK:       while.body.lr.ph:
; CHECK-NEXT:    br label [[WHILE_BODY:%.*]]
; CHECK:       while.body:
; CHECK-NEXT:    [[KEYLEN_010:%.*]] = phi i32 [ [[LEN]], [[WHILE_BODY_LR_PH]] ], [ [[SUB:%.*]], [[WHILE_BODY]] ]
; CHECK-NEXT:    [[S_ADDR_09:%.*]] = phi i8* [ [[S:%.*]], [[WHILE_BODY_LR_PH]] ], [ [[ADD_PTR:%.*]], [[WHILE_BODY]] ]
; CHECK-NEXT:    [[T1:%.*]] = bitcast i8* [[S_ADDR_09]] to i32*
; CHECK-NEXT:    [[T2:%.*]] = load i32, i32* [[T1]], align 4
; CHECK-NEXT:    [[SHL_I:%.*]] = shl i32 [[T2]], 1
; CHECK-NEXT:    [[AND_I:%.*]] = and i32 [[SHL_I]], 16843008
; CHECK-NEXT:    [[T3:%.*]] = load i32, i32* [[A]], align 4
; CHECK-NEXT:    [[SUB_I:%.*]] = add i32 [[T3]], [[T2]]
; CHECK-NEXT:    [[ADD:%.*]] = sub i32 [[SUB_I]], [[AND_I]]
; CHECK-NEXT:    store i32 [[ADD]], i32* [[A]], align 4
; CHECK-NEXT:    [[ADD_PTR]] = getelementptr inbounds i8, i8* [[S_ADDR_09]], i64 12
; CHECK-NEXT:    [[SUB]] = add i32 [[KEYLEN_010]], -12
; CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i32 [[SUB]], 11
; CHECK-NEXT:    br i1 [[CMP]], label [[WHILE_BODY]], label [[WHILE_COND_WHILE_END_CRIT_EDGE:%.*]]
; CHECK:       while.cond.while.end_crit_edge:
; CHECK-NEXT:    [[SUB_LCSSA:%.*]] = phi i32 [ [[SUB]], [[WHILE_BODY]] ]
; CHECK-NEXT:    br label [[WHILE_END]]
; CHECK:       while.end:
; CHECK-NEXT:    [[KEYLEN_0_LCSSA:%.*]] = phi i32 [ [[SUB_LCSSA]], [[WHILE_COND_WHILE_END_CRIT_EDGE]] ], [ [[LEN]], [[ENTRY:%.*]] ]
; CHECK-NEXT:    call void @_Z3mixRjj(i32* dereferenceable(4) [[A]], i32 [[KEYLEN_0_LCSSA]])
; CHECK-NEXT:    [[T4:%.*]] = load i32, i32* [[A]], align 4
; CHECK-NEXT:    call void @llvm.lifetime.end.p0i8(i64 4, i8* [[T]])
; CHECK-NEXT:    ret i32 [[T4]]
;
entry:
  %a = alloca i32, align 4
  %t = bitcast i32* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %t)
  store i32 -1640531527, i32* %a, align 4
  %cmp8 = icmp ugt i32 %len, 11
  br i1 %cmp8, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %keylen.010 = phi i32 [ %len, %while.body.lr.ph ], [ %sub, %while.body ]
  %s.addr.09 = phi i8* [ %s, %while.body.lr.ph ], [ %add.ptr, %while.body ]
  %t1 = bitcast i8* %s.addr.09 to i32*
  %t2 = load i32, i32* %t1, align 4
  %shl.i = shl i32 %t2, 1
  %and.i = and i32 %shl.i, 16843008
  %t3 = load i32, i32* %a, align 4
  %sub.i = add i32 %t3, %t2
  %add = sub i32 %sub.i, %and.i
  store i32 %add, i32* %a, align 4
  %add.ptr = getelementptr inbounds i8, i8* %s.addr.09, i64 12
  %sub = add i32 %keylen.010, -12
  %cmp = icmp ugt i32 %sub, 11
  br i1 %cmp, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %sub.lcssa = phi i32 [ %sub, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %keylen.0.lcssa = phi i32 [ %sub.lcssa, %while.cond.while.end_crit_edge ], [ %len, %entry ]
  call void @_Z3mixRjj(i32* dereferenceable(4) %a, i32 %keylen.0.lcssa)
  %t4 = load i32, i32* %a, align 4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %t)
  ret i32 %t4
}

define i32 @zero_backedge_count_test(i32 %unknown_init, i32* %unknown_mem) {
; CHECK-LABEL: @zero_backedge_count_test(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[UNKNOWN_NEXT:%.*]] = load volatile i32, i32* [[UNKNOWN_MEM:%.*]], align 4
; CHECK-NEXT:    br i1 false, label [[LOOP_LOOP_CRIT_EDGE:%.*]], label [[LEAVE:%.*]]
; CHECK:       loop.loop_crit_edge:
; CHECK-NEXT:    unreachable
; CHECK:       leave:
; CHECK-NEXT:    ret i32 [[UNKNOWN_INIT:%.*]]
;
entry:
  br label %loop

loop:
  %iv = phi i32 [ 0, %entry], [ %iv.inc, %loop ]
  %unknown_phi = phi i32 [ %unknown_init, %entry ], [ %unknown_next, %loop ]
  %iv.inc = add i32 %iv, 1
  %be_taken = icmp ne i32 %iv.inc, 1
  %unknown_next = load volatile i32, i32* %unknown_mem
  br i1 %be_taken, label %loop, label %leave

leave:
; We can fold %unknown_phi even though the backedge value for it is completely
; unknown, since we can prove that the loop's backedge taken count is 0.

  %exit_val = phi i32 [ %unknown_phi, %loop ]
  ret i32 %exit_val
}
