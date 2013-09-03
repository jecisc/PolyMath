as yet unclassified
testDoStepTimeStepSize1
	| stepper sys dt |
	sys := ImplicitSystem block: [:x :t | x * t].
	stepper := TrapezoidStepper  onSystem: sys.
	dt := 0.1.
	self should: [(stepper doStep: 0 time: 10 stepSize: dt) closeTo:  0.0 ].
	self should: [(stepper doStep: 10 time: 0 stepSize: dt) closeTo:  10.05 ].
	self should: [(stepper doStep: 1 time:  1 stepSize: dt) closeTo: 1.1111].
	self should: [(stepper doStep: 10 time:  1 stepSize: dt) closeTo:  11.11].