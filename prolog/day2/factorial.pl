fact(1, 1).
fact(X, Y) :- X > 1, X2 is X - 1, fact(X2, Z), Y is Z * X.

/*
	fact(1, 1).
	fact(X, Y) :- X > 1, X2 is X - 1, Y is fact(X2) * X
	fac(5)
*/
