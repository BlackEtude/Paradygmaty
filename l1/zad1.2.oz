declare
fun {Reverse L}
   local
      fun {Rev Start End}
	 if Start == nil then End
	 else
	    local Head Tail in
	       Head|Tail = Start
	       {Rev Tail Head|End}
	    end
	 end
      end
   in
      {Rev L nil}
   end
end

fun {Merge2 Lista1 Lista2}
   local
      fun {Merge2R List1 List2 Result}
	 if {And List1 == nil List2 == nil} then Result
	 else
	    local Head1 Tail1 Head2 Tail2 in
	       if List1 == nil then
		  Head1 = nil
		  Tail1 = nil
	       else Head1|Tail1 = List1 end
	       if List2 == nil then
		  Head2 = nil
		  Tail2 = nil
	       else
		  Head2|Tail2 = List2 end
	       if {And Head1 == nil Head2 \= nil} then {Merge2R Tail1 Tail2 Head2|Result}
	       elseif {And Head1 \= nil Head2 == nil} then {Merge2R Tail1 Tail2 Head1|Result}
	       else
		  if Head1 > Head2 then {Merge2R Tail2 List1 Head2|Result}
		  else {Merge2R List2 Tail1 Head1|Result} end
	       end
	    end
	 end
      end
   in
      {Reverse {Merge2R Lista1 Lista2 nil}}
   end
end

fun {Merge3 List1 List2 List3}
   {Merge2 List1 {Merge2 List2 List3}}
end

{Browse {Merge3 [5 9 11] [0 6 12] [1 2 3]}}