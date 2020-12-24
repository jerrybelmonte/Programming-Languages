% "Haskell type inference"
% Illustrate Haskell type inference in Prolog

% Use the following atoms and functors to express Haskell:
% Prolog    Haskell
% type/2    ::      type assignment
% to/2      ->      function type
% app/2             function application
% list/1    [_]     list type constructor
% nil/0     []      Nil list constructor
% cons/0    :       Cons list constructor
% int/0     Int     int type

%    f x :: b      if     f :: a->b   and  x :: a
type(app(F, X), B) :- type(F, to(A, B)), type(X, A).

%    (:) :: a -> [a] -> [a]
type(cons, to(A, to(list(A), list(A)))).

%    []  :: [a]
type(nil, list(_)).

%    1 :: Int
type(1, int).

% [1] :: ?
% ?- type(app(app(cons, 1), nil), T).

% [a, 1] :: ?
% type(app(app(cons, a), app(app(cons, 1), nil)), T).