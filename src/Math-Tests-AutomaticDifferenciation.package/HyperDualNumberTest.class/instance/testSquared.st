tests-mathematical functions
testSquared
self assert: ((HyperDualNumber value: -3 eps: 5eps2: 1 eps1eps2: 0) squared equalsTo: (HyperDualNumber value: 9 eps: -30 eps2: -6 eps1eps2: 10)).
zeroc eps1eps2: 2.
self assertEquality: zero squared and: zeroc. 