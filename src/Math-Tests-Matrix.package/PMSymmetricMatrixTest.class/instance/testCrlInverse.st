tests
testCrlInverse
	| m i |
	m := PMSymmetricMatrix rows: #(#(2 2 3) #(2 4 5) #(3 5 6)).
	i := m crlInverse.
	self assert: m * i equals: (PMSymmetricMatrix identity: 3)
	"the funny result of m*i with the bug is this matrix:
a PMVector(1 0 -24)
a PMVector(0 1 -40)
a PMVector(2 4 -51)"