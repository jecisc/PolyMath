linear algebra
testMatrixInitialize
	| a |
	a := DhbMatrix new initialize: 2.
	self assert: a numberOfRows equals: 2.
	self assert: a numberOfColumns equals: 2