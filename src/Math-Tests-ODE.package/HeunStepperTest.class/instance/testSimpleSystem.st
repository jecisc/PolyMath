as yet unclassified
testSimpleSystem
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem block: [:x :t | t sin].
	stepper := HeunStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	self should: [( solver solve: system startState: -1 startTime: 0 endTime: Float pi ) closeTo: 1].