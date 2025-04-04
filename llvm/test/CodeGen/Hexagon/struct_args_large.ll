; XFAIL: *
; RUN: llc -mtriple=hexagon < %s | FileCheck %s
; CHECK: r[[T0:[0-9]+]] = CONST32(#s2)
; CHECK: memw(r29+#0) = r{{.}}
; CHECK: memw(r29+#8) = r{{.}}

%struct.large = type { i64, i64 }

@s2 = common global %struct.large zeroinitializer, align 8

define void @foo() nounwind {
entry:
  call void @bar(ptr byval(%struct.large) @s2)
  ret void
}

declare void @bar(ptr byval(%struct.large))
