-module(rotation).
-export([left_rotation/1]).

left_rotation({node, K1, V1, L1, {node, K2, V2, L2, R2}}) ->
    {node, K2, V2, {node, K1, V1, L1, L2}, R2};
left_rotation(_) -> error.