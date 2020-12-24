% "Quicksort - Prolog List Syntax, with Cut"

quicksort([], []).
quicksort([X|Xs], S) :-
	partition(Xs, X, Littles, Bigs),
	quicksort(Littles, Ls),
	quicksort(Bigs, Bs),
	append(Ls, [X|Bs], S).
    
partition([], _, [], []).
partition([X|Xs], Y, [X|Ls], Bs) :- X =< Y, !, partition(Xs, Y, Ls, Bs).
partition([X|Xs], Y, Ls, [X|Bs]) :- partition(Xs, Y, Ls, Bs).

% (++) [] ys = ys -- comparison with Haskell
append([], Ys, Ys).

% (++) (x:xs) ys = x : zs where zs = xs ++ ys -- comparison with Haskell
append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).