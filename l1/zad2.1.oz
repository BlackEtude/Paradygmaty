declare
proc {Game Id1 Id2}
   T1 T2
   fun {Player Id Stream}
      case Stream of
	 X|Y then {Delay 700} {Browse Id#X}
	 if X == pong then ping|{Player Id Y}
	 else pong|{Player Id Y}
	 end
      end
   end
in
   T1 = thread {Player Id1 ping|T2} end
   T2 = thread {Player Id2 T1} end
end

{Game 'p1' 'p2'}