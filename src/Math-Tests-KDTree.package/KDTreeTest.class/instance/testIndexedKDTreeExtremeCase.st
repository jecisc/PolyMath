tests
testIndexedKDTreeExtremeCase
|bResult|
tree :=IndexedKDTree  withAll: # (#( 1 )).								"extreme case"
bResult :=tree nnSearch: #(-1) i: 3.
self assert: (bResult size =1).
self assert: (bResult first = #(1 4) )    									"index 1, squared distance 4"