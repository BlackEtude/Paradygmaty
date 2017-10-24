jednokrotnie(E, L1) :- 
    select(E, L1, L2),
    \+ member(E, L2).

dwukrotnie(E, L) :- 
    append(B1, [E|A1], L), 
    \+ member(E, B1), 
    jednokrotnie(E, A1).

%% dwukrotnie2(E, L1) :- 
%% 	select(E, L1, L2),
%%     select(E, L2, L3),
%%     \+ member(E, L3).