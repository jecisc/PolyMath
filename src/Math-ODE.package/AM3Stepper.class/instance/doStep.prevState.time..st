as yet unclassified
doStep: aState prevState: prevState time: t
	| approximateState1 approximateState2 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	approximateState1 := aState + (self stepSize * (system x: aState t: t + self stepSize)).
	approximateState2 := aState
		+
			(self stepSize
				*
					(5 / 12 * (system x: approximateState1 t: t + (2 * self stepSize)) + (2 / 3 * (system x: aState t: t + self stepSize))
						- (1 / 12 * (system x: prevState t: t)))).
	^ aState
		+
			(self stepSize
				*
					(5 / 12 * (system x: approximateState2 t: t + (2 * self stepSize)) + (2 / 3 * (system x: aState t: t + self stepSize))
						- (1 / 12 * (system x: prevState t: t))))