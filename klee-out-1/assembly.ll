; ModuleID = 'klee_insulinamount.bc'
source_filename = "klee_insulinamount.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @insulin(i32 %x, i32 %y) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %delta = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %delta, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %x.addr, align 4, !dbg !17
  %1 = load i32, i32* %y.addr, align 4, !dbg !18
  %sub = sub nsw i32 %0, %1, !dbg !19
  store i32 %sub, i32* %delta, align 4, !dbg !16
  %2 = load i32, i32* %delta, align 4, !dbg !20
  %cmp = icmp sgt i32 %2, 5, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %delta, align 4, !dbg !24
  store i32 %3, i32* %retval, align 4, !dbg !26
  br label %return, !dbg !26

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !28
  ret i32 %4, !dbg !28
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 !dbg !29 {
entry:
  %retval = alloca i32, align 4
  %blood_glucose = alloca i32, align 4
  %target_bg = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %blood_glucose, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %target_bg, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 45, i32* %target_bg, align 4, !dbg !35
  %0 = bitcast i32* %blood_glucose to i8*, !dbg !36
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !37
  %1 = load i32, i32* %blood_glucose, align 4, !dbg !38
  %2 = load i32, i32* %target_bg, align 4, !dbg !39
  %call = call i32 @insulin(i32 %1, i32 %2), !dbg !40
  ret i32 %call, !dbg !41
}

declare void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.1 (branches/release_60 355598)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "klee_insulinamount.c", directory: "/home/klee/klee_src/examples/M-CyPhySe")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.1 (branches/release_60 355598)"}
!7 = distinct !DISubprogram(name: "insulin", scope: !1, file: !1, line: 10, type: !8, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 10, type: !10)
!12 = !DILocation(line: 10, column: 17, scope: !7)
!13 = !DILocalVariable(name: "y", arg: 2, scope: !7, file: !1, line: 10, type: !10)
!14 = !DILocation(line: 10, column: 24, scope: !7)
!15 = !DILocalVariable(name: "delta", scope: !7, file: !1, line: 11, type: !10)
!16 = !DILocation(line: 11, column: 7, scope: !7)
!17 = !DILocation(line: 11, column: 15, scope: !7)
!18 = !DILocation(line: 11, column: 19, scope: !7)
!19 = !DILocation(line: 11, column: 17, scope: !7)
!20 = !DILocation(line: 12, column: 7, scope: !21)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 7)
!22 = !DILocation(line: 12, column: 13, scope: !21)
!23 = !DILocation(line: 12, column: 7, scope: !7)
!24 = !DILocation(line: 13, column: 12, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !1, line: 12, column: 17)
!26 = !DILocation(line: 13, column: 5, scope: !25)
!27 = !DILocation(line: 16, column: 3, scope: !7)
!28 = !DILocation(line: 17, column: 1, scope: !7)
!29 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 22, type: !30, isLocal: false, isDefinition: true, scopeLine: 22, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!10}
!32 = !DILocalVariable(name: "blood_glucose", scope: !29, file: !1, line: 27, type: !10)
!33 = !DILocation(line: 27, column: 7, scope: !29)
!34 = !DILocalVariable(name: "target_bg", scope: !29, file: !1, line: 30, type: !10)
!35 = !DILocation(line: 30, column: 7, scope: !29)
!36 = !DILocation(line: 31, column: 21, scope: !29)
!37 = !DILocation(line: 31, column: 2, scope: !29)
!38 = !DILocation(line: 34, column: 17, scope: !29)
!39 = !DILocation(line: 34, column: 32, scope: !29)
!40 = !DILocation(line: 34, column: 9, scope: !29)
!41 = !DILocation(line: 34, column: 2, scope: !29)
