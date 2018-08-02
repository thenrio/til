is not trivial...

mnesia:transaction(fun () -> mnesia:foldl(fun(X, Acc) -> [X|Acc] end, [], rabbit_queue) end).

[reference](http://erlang.org/pipermail/erlang-questions/2005-August/016441.html).
