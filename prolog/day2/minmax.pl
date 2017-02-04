findMin([Head|[]], Head).
findMin([Head|Tail], Min) :- findMin(Tail, Min2), Min is min(Head, Min2).

findMax([Head|[]], Head).
findMax([Head|Tail], Max) :- findMax(Tail, Max2), Max is max(Head, Max2).


/*
	min([1,3,2], What).
	min(1|[3,2], Min) :- min([3,2], Min2), min(1, Min2)
*/

