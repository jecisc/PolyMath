tests
testRest
	fp := PMFixpoint block: [ :x | 1 / (1 + x) ] value: 20.0.
	self assert: fp cycle equals: #().
	self assert: (fp evaluate equalsTo: 0.6180339887).
	fp verbose: false.
	self assert: fp cycle size equals: 1.
	self assert: fp hasConverged.
	self assert: fp cycleLength equals: 1.
	fp evaluate.
	self assert: fp iterations equals: 1.
	self assert: fp hasConverged.
	fp block: [ :x | x asString ].
	self assert: (fp evaluate beginsWith: '0.618').
	self assert: fp iterations equals: 2.
	self assert: fp hasConverged