tests
testWrongStandardDeviationProbabilistic
"is a probabilistic test that occasionally fails, but it should happen rarely"
|d|
d:=self numberOfRejectionsFor: (DhbNormalDistribution new: 0 sigma: 2).
self assert:d>96.