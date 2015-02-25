-module(prime).
-export([
         prime/1,
         length/1
        ]).

prime(N) ->
    eratos([2|lists:seq(3, N, 2)]).

eratos([]) ->
    [];
eratos([H|T]) ->
    [H|eratos([X || X <- T, X rem H /= 0])].

length(List) ->
    length(List, 0).

length([_|T], N) ->
    length(T, N+1);
length([], N) ->
    N.
