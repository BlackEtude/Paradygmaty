declare
fun {SearchTree V T}
   local
      fun {SearchTree2 V T Result}
	 case T
	 of leaf then Result
	 [] tree(key:K value:X left:T1 right:T2) then
	    if X \= V then {SearchTree2 V T1 {SearchTree2 V T2 Result}}
	    else {SearchTree2 V T1 K|{SearchTree2 V T2 Result}}
	    end
	 end
      end
   in
      {SearchTree2 V T nil}
   end
end

T1 = tree(key:1 value:1 left:leaf right:leaf)
T2 = tree(key:2 value:3 left:T1 right:leaf)
T3 = tree(key:3 value:5 left:T2 right:T5)
T5 = tree(key:5 value:3 left:leaf right:leaf)
T6 = tree(key:6 value:2 left:T3 right:T10)
T7 = tree(key:7 value:2 left:leaf right:leaf)
T11 = tree(key:11 value:8 left:leaf right:leaf)
T10 = tree(key:10 value:3 left:T7 right:T11)
{Browse {SearchTree 3 T6}}