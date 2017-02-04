-module(double).
-export([double_all/1]).

double_all([]) -> [];
double_all([H | T]) -> [H * 2 | double_all(T)].