import Data.List
permutacje :: [Integer] -> [[Integer]]
permutacje x = permutacje2 x []

permutacje2 :: [Integer] -> [Integer] -> [[Integer]]
permutacje2 list accu
 | list == [] = [accu]
 | otherwise = foldl1 (++) [(permutacje2 (delete x list) (accu ++ [x])) | x <- list]