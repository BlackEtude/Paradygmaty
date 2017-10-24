filter(H, S, X):-
	freeze(S, (S = [Z|T] -> 
		(Z mod H =\= 0 ->
			X = [Z|X_],
			filter(H, T, X_); 
			filter(H, T, X));
		X = [])).

sieve2(S, L):-
    freeze(S, (S = [H|T] -> 
    	L = [H|L_],
    	filter(H, T, Z),
    	sieve2(Z, L_);
    	L = [])).

sieve(N, L):-
	set_prolog_flag(answer_write_options, [max_depth(0)]),
	sieve2(S, L),
	numlist(2, N, S).