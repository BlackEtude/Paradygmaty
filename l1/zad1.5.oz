declare
fun {InsertAll L V}
   local
      fun {InsAll2 H T S}
	 local S1 in
	    S1 = {Append H V|T}|S
	    if T == nil then S1
	    else
	       local H1 T1 in
		  H1|T1 = T
		  {InsAll2 {Append H H1|nil} T1 S1}
	       end
	    end
	 end
      end
   in
      {InsAll2 nil L nil}
   end
end

fun {InsertAllLists Ls V}
   local
      fun {InsertAllLists2 Ls S}
	 if Ls == nil then S
	 else
	    local H T in
	       H|T = Ls
	       {InsertAllLists2 T {Append S {InsertAll H V}}}
	    end
	 end
      end
   in
      {InsertAllLists2 Ls nil}
   end
end

fun {Permutation L}
   {FoldL L fun {$ X Y} {InsertAllLists X Y} end [nil]}
end

{Browse {Permutation [1 2 3]}}