-module(przedszkole).
-compile(export_all).

przedszkolanka(N) -> 
	spawn(?MODULE, manager, [[], N]).

rpc(Pid, Request) ->
	Pid ! Request,
		receive
			{Pid, Response} ->
				Response
		after 5000 -> wrongPid
		end.

manager(ChildrenList, N) ->
	receive
	{From, odbierz, Child} ->
			case lists:member({From, Child}, ChildrenList) of
				true ->
					From ! {self(), {ok, Child}},
					manager(lists:delete({From, Child}, ChildrenList), N);
				false ->
					From ! {self(), error},
					manager(ChildrenList, N)
			end;
	{From, pozostaw, Child} ->
			case length(ChildrenList) < N of
				true ->
					From ! {self(), {ok, Child}},
					manager([{From, Child}|ChildrenList], N);
				false ->
					From ! {self(), error},
					manager(ChildrenList, N)
			end;
		
		terminate -> ok
	end.
	
parent(Pid, What) -> 
	rpc(Pid, What).
