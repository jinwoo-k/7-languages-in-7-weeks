concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :- concatenate(Tail1, List, Tail2).

/*	concatenate([1,2], [3], What)
	concatenate([1 | [2]], [3], [1 | [Tail2-A]]) :- concatenate([2], [3], [Tail2-A]) 
	concatenate([2 | []], [3], [2 | Tail2-B]) :- concatenate([], [3], [Tail2-B])
	Tail2-B : [3]
	Tail2-A : [2, 3]
	Tail2 : [1, 2, 3] */

