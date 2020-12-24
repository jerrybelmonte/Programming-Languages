% Negation

% All we need is
%   variables
%   atoms
%   functors
%   :- "if"  (implication)
%   ,  "and" (conjunction)
%
% to make the following:

eq(X, X).              % =  (equality)

or(A, _) :- A.         % ;  "or" (disjunction)
or(_, B) :- B.

% etc. ...

% except for negation  % \+ "not"
not(A) :- A, !, false. 
not(_).

% To define negation we also need the "cut" !/0.

% The above implementation of negation is called
%   "Negation as failure".

% The cut is an atom !/0 and in particular a true fact.
% In adition it has the following side effect:
%     If it is reached during SLD-resolution,
%     then it prevents backtracking, i.e.
%         no further alternatives to the head
%         of the current rule will be tried.

% This negation is only sound when all
%   variables are ground, i.e. bound to values.
%
% Try the following:
% ?- \+ a=b.
% ?- \+ a=a.
% ?- \+ X=a.
% ?- \+ X=a, X=b.   % this doesn't work as expected
% ?- X=b, \+ X=a.   % this works, because X is ground