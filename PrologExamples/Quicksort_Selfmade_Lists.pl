% "Quicksort - Selfmade Lists"

quicksort(nil, nil).
quicksort(cons(X, Xs), S) :-
	partition(Xs, X, Littles, Bigs),
	quicksort(Littles, Ls),
	quicksort(Bigs, Bs),
	append(Ls, cons(X, Bs), S).
    
partition(nil, _, nil, nil).
partition(cons(X, Xs), Y, cons(X, Ls), Bs) :- lessOrEq(X, Y), !, partition(Xs, Y, Ls, Bs).
partition(cons(X, Xs), Y, Ls, cons(X, Bs)) :- partition(Xs, Y, Ls, Bs).

append(nil, Ys, Ys).
append(cons(X, Xs), Ys, cons(X, Zs)) :- append(Xs, Ys, Zs).

less(a, b).
less(b, c).
less(c, d).

lessOrEq(X, X).
lessOrEq(X, Y) :- less(X, Z), lessOrEq(Z, Y).

% Try: ?- quicksort(cons(b, cons(d, cons(a,nil))), S).