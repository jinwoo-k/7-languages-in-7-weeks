-module(exam).
-export([keyvalue/2]).
-export([total_price/1]).


keyvalue(Example_tuple, Keyword) -> [Desc || {Key, Desc} <- Example_tuple, Key == Keyword].

total_price(Cart) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- Cart].