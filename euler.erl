-module(euler).

-export([
         problem001/0,
         problem002/0,
         problem003/0,
         problem004/0,
         problem005/0,
         problem006/0,
         problem007/0,
         problem008/0
        ]).

problem001() ->
    lists:sum([X || X <- lists:seq(1, 999), (X rem 3 == 0) or (X rem 5 == 0)]).

problem002() ->
    lists:sum([X || X <- fiblist(2,[]), X rem 2 == 0]).

fiblist(N, List) ->
    X = fib(N),
    if X =< 4000000 ->
            fiblist(N+1, [X|List]);
       true  ->
            List
    end.

fib(0) ->
    0;
fib(1) ->
    1;
fib(N) ->
    fib(N-1) + fib(N-2).

problem003() ->
    List = prime:prime(10000),
    problem003(0, 600851475143, List).

problem003(Max, _, []) ->
    Max;
problem003(Max, Target, [H|T]) ->
    if Target rem H == 0 ->
            problem003(H, Target, T);
       true  ->
            problem003(Max, Target, T)
    end.

problem004() ->
    isPalindromic(999*999, false).

isPalindromic(N, true) ->
    N+1;
isPalindromic(N, _) ->
    String = erlang:integer_to_list(N),
    RString = lists:reverse(String),
    if String == RString ->
            Decision = isDivisible(N, 100);
       true ->
            Decision = false
    end,
    isPalindromic(N-1, Decision).
                
isDivisible(_, 1000) ->
    false;
isDivisible(N, A) ->
    if N rem A == 0 ->
            Result = N div A,
            if (100 =< Result) and (Result =< 999) ->
                    true;
               true ->
                    isDivisible(N, A+1)
            end;
       true  ->
            isDivisible(N, A+1)
    end.

problem005() ->
    problem005(2520, 1).

problem005(N, 20) ->
    N;
problem005(N, A) ->
    if N rem A == 0 ->
            problem005(N, A+1);
       true  ->
            problem005(N+20, 1)
    end.

problem006() ->
    List = lists:seq(1,100),
    MultiSum = lists:sum(lists:map(fun(X) -> X*X end, List)),
    SumMulti = lists:sum(List) * lists:sum(List),
    SumMulti - MultiSum.

problem007() ->
    lists:nth(10001, prime:prime(150000)).

problem008() ->
    String = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450".
