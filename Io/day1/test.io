"Hello world!" println

myObject := Object clone

myObject factorial := method(n, if(n == 1, 1, n * factorial(n - 1)))

"factorial 5 is " print
myObject factorial(5) println

myObject getSlot("factorial")
