declare
fun {Node E In Stream}
   case In
   of nil then
      Stream = nil
      E
   [] Head|Tail then NewStream in
      if E >= Head then
	 Stream = E|NewStream
	 {Node Head Tail NewStream}
      else
	 Stream = Head|NewStream
	 {Node E Tail NewStream}
      end
   end
end

fun {NSort In}
   case In
   of nil then nil
   [] Head|Tail then Stream in
      thread {Node Head Tail Stream} end|
      {NSort Stream}
   end
end

{Browse {NSort 1|5|2|3|4|1|2|nil}}

