f(0, 1).
f(1, 1).
f(X, Y) :- X > 1, X1 is X - 1, X2 is X - 2, f(X1, Z), f(X2, W), Y is W + Z.

fib(X) :- f(X, Y), write(Y), nl.

/*

0, 1, 1, 2, 3, 5, 8, 13, 21...

*/