information
valueAndGradient: aNumber
	"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber."

	| dp |
	dp := self value: aNumber.
	^ Array with: dp with: (PMVector with: (aNumber / beta - 1) * dp / beta)