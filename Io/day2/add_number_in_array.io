

sumList := method(n,
	sum := 0
	for (i, 0, n size - 1, 1, 
		sum = sum + if (n at(i) proto == Number, n at(i), sumList(n at(i)))
	)
	sum
)

l := list(
	list(1,2,3),
	list(4,5,6),
	list(7,8,9)
)

sumList(l) println