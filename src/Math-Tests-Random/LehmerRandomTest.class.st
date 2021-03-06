Class {
	#name : #LehmerRandomTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-Random'
}

{ #category : #tests }
LehmerRandomTest >> testNextBetweenZeroAndOne [
	| g |
	g := PMLehmerRandomGenerator new.
	1000
		timesRepeat: [ self assert: g next > 0.
			self assert: g next < 1 ]
]

{ #category : #tests }
LehmerRandomTest >> testPeekAlwaysReplyTheSameValue [
	| g |
	g := PMLehmerRandomGenerator new.
	self assert: g peek equals: g peek
]

{ #category : #tests }
LehmerRandomTest >> testPeekAnswersSameAsNext [
	| g |
	g := PMLehmerRandomGenerator new.
	self assert: g peek equals: g next
]
