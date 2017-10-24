split :: [Integer] -> ([Integer], [Integer])
split x = ((split2 x 0), (split2 x 1))

split2 :: [Integer] -> Integer -> [Integer]
split2 args counter
 | args == [] = []
 | counter `mod` 2 == 0 = (head args):(split2 (tail args) (counter+1)) 
 | otherwise = (split2 (tail args) (counter+1))