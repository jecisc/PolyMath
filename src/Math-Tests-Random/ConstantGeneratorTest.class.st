Class {
	#name : #ConstantGeneratorTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-Random'
}

{ #category : #tests }
ConstantGeneratorTest >> testConstantGenerator [
	| g |
	g := PMConstantGenerator new.
	g constant: 1.
	self assert: g next equals: g next.
	self assert: g next equals: g next.
	self assert: g next equals: 1.
	g := PMConstantGenerator constant: 2.
	self assert: g next equals: 2
]
