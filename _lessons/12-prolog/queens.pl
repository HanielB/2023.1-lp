perm([], []).
perm(List, [H|Perm]) :- select(H, List, Rest), perm(Rest, Perm).

test([], _, _, _).
test([Y|Ys], X, Cs, Ds) :-
    C is X-Y, not(member(C, Cs)),
    D is X+Y, not(member(D, Ds)),
    X1 is X + 1,
    test(Ys, X1, [C|Cs], [D|Ds]).

queen8(Q) :- perm([1,2,3,4,5,6,7,8], Q), test(Q, 1, [], []).

allQueen8(A) :- findall(Q, queen8(Q), A).
countAllQueen8(C) :- allQueen8(A), length(A, C).

range(A,A,[A]).
range(A,B,[A|L]) :- A < B, A1 is A+1, range(A1,B,L).

queenN(N, Q) :- range(1, N, L), perm(L, Q), test(Q, 1, [], []).
allQueenN(N, A) :- findall(Q, queenN(N, Q), A).
countAllQueenN(N, C) :- allQueenN(N, A), length(A, C).
