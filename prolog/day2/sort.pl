naive_sort(List, Sorted) :- perm(List, Sorted), is_sorted(Sorted).
   
is_sorted([]).
is_sorted([_]).
is_sorted([X, Y | T]) :- X =< Y, is_sorted([Y|T]).


insert_sort(List, Sorted) :- i_sort(List, [], Sorted).
i_sort([], Acc, Acc).
i_sort([H | T], Acc, Sorted) :- insert(H, Acc, NAcc), i_sort(T, NAcc, Sorted).
   
insert(X, [Y|T], [Y|NT]) :- X > Y, insert(X, T, NT).
insert(X, [Y|T], [X,Y|T]) :- X =< Y.
insert(X, [], [X]).