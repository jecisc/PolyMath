tests
testDistributionValue
self assert: ((density distributionValue: 500) =1).
self assert: ((density distributionValue: -500) =0).
self assert: ((density distributionValue: 2) equalsTo:  0.494519759).
self assert: ((density distributionValue: 3) equalsTo:  0.8791407588).
density epanechnikov .
self assert: ((density distributionValue: 5) =1).
self assert: ((density distributionValue: -1) =0).
self assert: ((density distributionValue: 2) equalsTo:  0.506985855).