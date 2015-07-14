initialization
initialize: aNumber1 scale: aNumber2
	"Private - Initialize the parameters of the receiver."
	( aNumber1 > 0 and: [ aNumber2 > 0])
		ifFalse: [ self error: 'Illegal distribution parameters'].
	alpha := aNumber1.
	beta := aNumber2.
	self computeNorm.
	^self