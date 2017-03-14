tests
testEqual
	"= should work like in a SequenceableCollection  eg a PMVector and a Array can be equal"

	| a b |
	a := PMMatrix rows: #(#(2 2 3) #(2 4 5) #(3 5 6)).
	b := a asSymmetricMatrix.
	self assert: a equals: b.
	self assert: b equals: a.
	self assert: a hash equals: b hash.
	a := PMMatrix rows: #(#(1 2 3) #(2 4 5) #(3 5 6)).
	self assert: a ~= b.
	self assert: b ~= a.
	self assert: a hash ~= b hash.
	a := a asSymmetricMatrix.
	self assert: a ~= b.
	a := 2.
	self assert: b ~= a.
	a := 's'.
	self assert: b ~= a