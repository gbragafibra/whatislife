f :: Int -> Int 
f = \x -> x^2
-- Can also have f x = x^2

g :: Int -> Int 
g = \x -> x + 1

h = f.g
i = g.f 

main = do 
	print (h 2)
	print (i 2)