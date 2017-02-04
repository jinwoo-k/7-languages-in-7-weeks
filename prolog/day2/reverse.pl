rev([], []).
rev([Head|[]], Head).
rev([Head|Tail], Rev) :- rev(Tail, Rev2), append(Rev2, [Head], Rev).
/*

	rev([1,2,3], What).
	rev(1|[2,3], Rev-A) :- rev([2,3], Rev2), append(Rev2, [1], Rev-A).
	rev(2|[3], Rev-B) :- rev([3], Rev2), append(Rev2, [2], Rev-B).
	rev(3|[], Rev-C)

	Rev-C = [3]
	Rev-B = [3,2]
	Rev-A = [3,2,1]
	What = [3,2,1]
*/