double dispatching
productWithTransposeMatrix: aMatrix
	"Answers the product of the receiver with the transpose of aMatrix(in this order)."
	^ DhbMatrix rows: (self rowsCollect: [ :row | aMatrix rowsCollect: [ :col | row * col]])