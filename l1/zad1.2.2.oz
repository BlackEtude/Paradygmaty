declare
fun {Merge2 List1 List2}
   case List1#List2
   of nil#List2 then List2
   [] List1#nil then List1
   [] (H1|T1)#(H2|T2) then
      if H1 =< H2 then
	 H1|{Merge2 T1 List2}
      else
	 H2|{Merge2 List1 T2}
      end
   end
end

fun {Merge List1 List2 List3}
   {Merge2 List1 {Merge2 List2 List3}}
end

A = [0 5 6 8]
B = [2 4 7]
C = [1 3 9]
{Browse 'Merge:'#{Merge A B C}}