tests
testFormatTypePostfixTree
|t|
t:=KeyedTree new.
self assert: ((a format: #(100.0 'rez' 0.18899) type:'x' postfix:'%%' tree: t) contents=  'x: 1.0e2%% , rez%% , 0.189%% ' ).
self assert:(t=(KeyedTree new at:'x' put:#(100.0 'rez' 0.18899);yourself) ).