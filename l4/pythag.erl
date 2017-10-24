-module(pythag).
-export([pythag/1]).

pythag(SUM) ->
	if SUM rem 2 == 0 ->
		[{A,B,C} ||
			A <- lists:seq(1, (SUM div 3) - 1),
			B <- [(SUM*((SUM div 2) - A)) div (SUM - A)],
			C <- [SUM-A-B],
			A < B,
			A*A + B*B == C*C];
	true -> 
		[]
	end.