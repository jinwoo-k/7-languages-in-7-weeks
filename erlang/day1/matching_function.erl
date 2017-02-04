-module(matching_function).
-export([number/1, string/1]).

number(one) -> 1;
number(two) -> 2;
number(three) -> 3.

string("string1") -> 1;
string(Str) -> Str.