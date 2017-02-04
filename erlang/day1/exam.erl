-module(exam).

-export([word_count/1]).
-export([count_to_ten/0]).
-export([successful/1]).


word_count2([]) -> 0;
word_count2([_ | Tail]) -> 1 + word_count2(Tail).
word_count(Str) -> word_count2(string:tokens(Str, " ")).

count_to(X, X) -> X;
count_to(X, Y) ->
	io:format("current number is ~.10B~n", [X]),
	count_to(X + 1, Y).
count_to_ten() -> count_to(1, 10).

successful(success) -> io:format("success~n", []);
successful({error, Message}) -> io:format("~s~n", [Message]).