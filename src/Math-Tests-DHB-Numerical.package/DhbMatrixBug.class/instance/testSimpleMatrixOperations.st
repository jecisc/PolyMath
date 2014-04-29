tests
testSimpleMatrixOperations
|s m s2 r r2|
"a mix of unsymmetric and symmetric matrices"
m :=DhbMatrix rows: #((1 2 3)(-1 -2 7)(5 6 7)).
s :=DhbSymmetricMatrix rows: #((1 2 3)(2 1 4)(3 4 0)).
s2 :=DhbSymmetricMatrix rows: #((1 2 0)(2 1 4)(0 4 0)).
"just to be sure that s and s2 are indeed symmetric:"
self assert: (s=s transpose ).
self assert: (s2=s2 transpose ).
r:=m*s.
self assert: (r =(DhbMatrix rows: #((14 16 11)(16 24 -11)(38 44 39)))).
self assert: (r class=DhbMatrix).
r:=s*m.
self assert: (r =(DhbMatrix rows: #((14 16 38)(21 26 41)(-1 -2 37)))).
self assert: (r class=DhbMatrix).
r:=s*s2.
self deny: (r=r transpose ).	"hence this (here is the bug) must be true:"
self assert: (r class=DhbMatrix).
self assert: (r =(DhbMatrix rows: #((5 16 8)(4 21 4)(11 10 16)))).
r:=s transposeProductWithMatrix:s2.
self deny: (r=r transpose ).	"hence this must be true:"
self assert: (r class=DhbMatrix).
r:=s productWithTransposeMatrix:s2.
self deny: (r=r transpose ).	"hence this must be true:"
self assert: (r class=DhbMatrix).

self assert: (s*s=s squared).
self assert: ((m transpose * m )=m squared).
self assert: ((r:=m+s)=(r2:=s+m)).
self assert: (r class=DhbMatrix).
self assert: (r2 class=DhbMatrix).
r2:=DhbMatrix rows: #((0 0 0)(-3 -3 3)(2 2 7)).
self assert: ((r:=m-s)=r2).
self assert: (r class=DhbMatrix).
r:=(s-m) negate .
self assert: (r=r2).
self assert: (r class=DhbMatrix).
self assert: ((r:=s2+s)=(s+s2)).
self assert: (r class=DhbSymmetricMatrix).
self assert: ((r:=s2-s)=(s-s2) negate) .
self assert: (r class=DhbSymmetricMatrix).
m:=DhbMatrix rows: #((-1 -2 7)(5 6 7)).
self assert: (m*s=(s*m transpose )transpose).
self assert: ((m transpose * m )=m squared).