Class {
	#name : #ImplicitMidpointSolverTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
ImplicitMidpointSolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := ImplicitMidpointStepper onSystem: system.
	solver := (ImplicitMidpointSolver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  4.9733).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo: 0.8242).
]
