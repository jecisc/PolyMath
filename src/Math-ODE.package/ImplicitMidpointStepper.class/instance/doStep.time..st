as yet unclassified
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	| xi1 xi2 ti |
	
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].

	ti := t + ((1/2)*self stepSize).
	xi1 := aState +( self stepSize * (system x: aState t: t)).
	xi2 := (1/2)*(aState + (system x: xi1 t: ti)).
	^ aState +  (self stepSize *  (system x: xi2 t: ti))	