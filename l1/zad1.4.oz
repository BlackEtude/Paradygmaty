declare
fun {SearchTree T V}
   if T == nil then nil
   else
      if T.value \= V then {Append {SearchTree T.left V} {SearchTree T.right V}}
      else {Append {SearchTree T.left V} T.key|{SearchTree T.right V}}
      end
   end
end

T1 = tree(key:1 value:1 left:nil right:nil)
T2 = tree(key:2 value:3 left:T1 right:nil)
T3 = tree(key:3 value:5 left:T2 right:T5)
T5 = tree(key:5 value:3 left:nil right:nil)
T6 = tree(key:6 value:2 left:T3 right:T10)
T7 = tree(key:7 value:2 left:nil right:nil)
T8 = tree(key:8 value:8 left:nil right:nil)
T10 = tree(key:10 value:3 left:T7 right:T8)


{Browse {SearchTree T6 3}}











