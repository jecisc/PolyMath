Class {
	#name : #AB4StepperTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
AB4StepperTest >> testOrderIsFour [
	self assert: AB4Stepper order equals: 4
]

{ #category : #'tests-stepping' }
AB4StepperTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem block: [ :x :t | t sin ].
	stepper := AB4Stepper onSystem: system.
	solver := AB4Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: -1
				startTime: 0
				endTime: Float pi) closeTo: 1)
]

{ #category : #'tests-stepping' }
AB4StepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := ExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := AB4Stepper onSystem: system.
	solver := AB4Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 5
				startTime: 0
				endTime: 1.5) closeTo: 3.67565).
	self
		should:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.5) closeTo: 0.28534)
]

{ #category : #'tests-stepping' }
AB4StepperTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := AB4Stepper onSystem: system.
	solver := AB4Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.5) closeTo: 1.25).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 1) closeTo: 2.4219).
	self
		assert:
			((solver
				solve: system
				startState: 2.4219
				startTime: 0.5
				endTime: 1) closeTo: 4.6924)
]
