MyProto := List clone
MyProto dim := method(x, y, 
	self setSize(x)
	for(i, 0, x - 1, 1, self atPut(i, list() setSize(y)))
)
MyProto set := method(x, y, value, self at(x) atPut(y, value))
MyProto get := method(x, y, self at(x) at(y))
MyProto transpose := method(
	new := MyProto dim(self at(0) size, self size)
	for (i, 0, self size - 1, 1, 
		for (j, 0, self at(0) size - 1, 1,
			new set(j, i, self get(i, j))
		)
	)
	new
)

a := MyProto clone
a dim(10, 10)
a set(3, 2, "a")
a get(3, 2) println



a println

"--------------" println

a transpose println



a save("array.txt")