as yet unclassified
testVectorSystem
	| solver stepper system dt |
	dt := 0.0001.
	system := ImplicitSystem block: [:x :t | | c | c:= DhbVector new: 2. 
												c at: 1 put: t sin. 
												c at: 2 put: t cos.
												c].
	stepper := BDF2Stepper onSystem: system.
	solver := (BDF2Solver new) stepper: stepper; system: system; dt: dt.
	self should: [(  (solver solve: system startState: #(-1 0) startTime: 0 endTime: Float pi ) at: 1)closeTo: 1].
	self should: [(  (solver solve: system startState: #(-1 0) startTime: 0 endTime: Float pi / 2 ) at: 2 ) closeTo: 1].