fib := method(n,
	if ((n == 1) or (n == 2), 1, fib(n - 1) + fib(n - 2))
)

fib(4) println

fib2 := method(n,
	if ((n == 1) or (n == 2), 1, 
		r1 := 1
		r2 := 1
		sum := r1 + r2
		for (i, 3, n, 1, 
			sum = r1 + r2
			r1 = r2
			r2 = sum
		)
		sum
	)
)
fib2(5) println