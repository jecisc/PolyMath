Hessian calculates the hessian of a function of a SequentialCollection of Numbers as a DhbSymmetricMatrix.  As a byproduct it also calculates the gradient.

Example: f(x,y)=x^2 * y
	h:=Hessian of:[:x|x first squared * x second].
	h value:#(3 2). "-->
	a DhbVector(4 6)
	a DhbVector(6 0) "
	h gradient ." -->#(12 9)"