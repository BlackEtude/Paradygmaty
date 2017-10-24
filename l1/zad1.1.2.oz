declare
fun {Reverse List}
   proc {Rev List ?RevList L}
      case List
      of nil then RevList = L
      [] Head|Tail then
	 {Rev Tail RevList Head|L}
      end
   end RevList
in
   {Rev List RevList nil}
   RevList
end

A = [7 6 5 4 3 2]
{Browse 'Starting list: '#A}
{Browse 'Reversed: '#{Reverse A}}