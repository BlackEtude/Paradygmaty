arc(a, b).
arc(a, d).
arc(b, c).
arc(b, e).
arc(c, f).
arc(d, e).
arc(d, g).
arc(e, f).
arc(e, h).
arc(f, i).
arc(g, h).
arc(h, i).

path(A, B, P) :-
       move(A, B, [A], Q), 
       reverse(Q, P).

move(A, B, P, [B|P]) :- arc(A, B).

move(A, B, Visited, P) :-
       arc(A, X),           
       X \== B,
       \+member(X, Visited),
       move(X, B, [X|Visited], P).