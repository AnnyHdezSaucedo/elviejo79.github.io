-- Exercise 1. Write a recursive function copy :: [a] -> [a] that copies its
-- list argument. For example, copy [2] ⇒[2].

import Test.HUnit t1 = ["copy [2,3] lista con algo" ~: [2,3] ~=? (copy [2,3]) ,"copy [1] lista con un elementa" ~: [1] ~=? (copy [1])] 
copy :: [a] -> [a]
copy [] = []
copy (x:xs) = x: copy xs

-- Exercise 2. Write a function inverse that takes a list of pairs and swaps the
-- pair elements. For example

--inverse [(1,2),(3,4)] ==> [(2,1),(4,3)]
t2 = ["inverse [(1,2),(3,4)]" ~: [(2,1),(4,3)] ~=? (inverse [(1,2),(3,4)])] inverse :: [(a,b)]-> [(b,a)] inverse [] = [(y,x)|(x,y)<-[]]
inverse :: [(a, b)] -> [(b, a)]
inverse [] = []
inverse ((a,b):ps)= (b,a): inverse ps

-- Exercise 3. Write a function
-- merge :: Ord a => [a] -> [a] -> [a]
-- which takes two sorted lists and returns a sorted list containing the elements
-- of each.
t3 = ["merge [2,4,6] [1,3,5]" ~: [1,2,3,4,5,6] ~=? (merge [2,4,6] [1,3,5])]
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] bs = bs
merge as [] = as
merge (a:as) (b:bs)=if a<b then a: merge as (b:bs) else b:merge(a:as) bs 



-- Exercise 4. Write (!!), a function that takes a natural number n and a list
-- and selects the nth element of the list. List elements are indexed from
-- 0, not 1, and since the type of the incoming number does not prevent it
-- from being out of range, the result should be a Maybe type. For example,
-- [1,2,3]!!0 ==> Just 1
-- [1,2,3]!!2 ==> Just 3
-- [1,2,3]!!5 ==> Nothing

-- t4 = "Excercise 4" ~: "[1,2,3]!!0" ~: Just 1 ~=? ((!!!) 0 [1,2,3]) , "[1,2,3]!!2" ~: Just 3 ~=? ((!!!) 2 [1,2,3]) , 
-- "[1,2,3]!!5" ~: Nothing ~=? ((!!!) 5 [1,2,3]) :: Int -> [a] -> Maybe a (!!!) 0 [] = Nothing

t4 = "Excercise 4" ~: "[1,2,3]!!0" ~: Just 1 ~=? ((ex4!) 0 [1,2,3]) , "[1,2,3]!!2" ~: Just 3 ~=? ((ex4!) 2 [1,2,3]) , "[1,2,3]!!5" ~: Nothing ~=? ((ex4!) 5 [1,2,3]) :: Int -> [a] -> Maybe a (ex4!) 0 [] = Nothing
ex4 :: Int -> [a] -> Maybe a
ex4 e [] = Nothing
ex4 0 (x:xs) = Just x
ex4 e (x:xs) = ex4 (e-1) xs



-- Exercise 5. Write a function lookup that takes a value and a list of pairs,
-- and returns the second element of the pair that has the value as its first
-- element. Use a Maybe type to indicate whether the lookup succeeded.
-- For example,
-- lookup 5 [(1,2),(5,3)] ==> Just 3
-- lookup 6 [(1,2),(5,3)] ==> Nothing
t5 = ["clookup 5 [(1,2),(5,3)]" ~: Just 3 ~=? (clookup 5 [(1,2),(5,3)]) , "clookup 6 [(1,2),(5,3)]" ~: Nothing ~=? (clookup 6 [(1,2),(5,3)])]
clookup :: Int -> [(Int,Int)]-> Maybe Int 
clookup e [] = Nothing 
clookup e ((a,b):as) = if a == e then Just b else clookup e as


-- Exercise 6. Write a function that counts the number of times an element
-- appears in a list.
t6 = ["ex6 2 [1,2,3,2,2,2]" ~: 4 ~=? (ex6 2 [1,2,3,2,2])] 
ex6 :: Eq a => a -> [a] -> Int
ex6 n [] = 0
ex6 n (x:xs)= if n == x then 1 + ex6 n xs else ex6 n xs


-- Exercise 7. Write a function that takes a value e and a list of values xs and
-- removes all occurrences of e from xs.
t7 = ["ex7 2 [1,2,3,2,2,2]" ~: [1,3] ~=? (ex7 2 [1,3])] 
ex7 :: Eq a => a -> [a] -> [a]
ex7 e [] = []
ex7 e (x:xs) = if e==x then ex7 e xs else x:ex7 e xs

-- Exercise 8. Write a function
-- f :: [a] -> [a]
-- that removes alternating elements of its list argument, starting with the
-- first one. For examples, f [1,2,3,4,5,6,7] returns [2,4,6].
t8 = ["ex8 [1,2,3,4,5,6,7]" ~: [2,4,6] ~=? (ex8 [1,2,3,4,5,6,7])] ex8 :: [a]->[a] ex8 xs = []
ex8 :: [a] -> [a]
ex8 [] = []
ex8 (x:xs) = f2 xs

f2 :: [a] -> [a]
f2 [] = []
f2 (x:xs) = x : ex8 xs


-- Exercise 9. Write a function extract :: [Maybe a] -> [a] that takes a
-- list of Maybe values and returns the elements they contain. For example,
-- extract [Just 3, Nothing, Just 7] = [3, 7].
t9 = ["extract [Just 3, Nothing, Just 7]" ~: [3,7] ~=? (extract [Just 3, Nothing, Just 7])] 
extract :: [Maybe a] -> [a]
extract [] = []
extract (Nothing:xs)= extract xs
extract (Just x:xs)=x:extract xs 

-- Exercise 10. Write a function
-- f :: String -> String -> Maybe Int
-- that takes two strings. If the second string appears within the first, it
-- returns the index identifying where it starts. Indexes start from 0. For
-- example,
-- f "abcde" "bc" ==> Just 1
-- f "abcde" "fg" ==> Nothing
t10 = ["loop \"abcde\" \"bc\"" ~: Just 1 ~=? (loop "abcde" "bc") , "loop \"abcde\" \"fg\"" ~: Nothing ~=? (loop "abcde" "fg")]
loop :: String -> String -> Int -> Maybe Int
loop [] s2 n = Nothing
loop (x:xs) s2 n = if length s2 > length (x:xs) then Nothing else if take (length s2) (x:xs) == s2
then Just n
else loop xs s2 (n+1)

f :: String -> String -> Maybe Int
f str1 str2 = loop str1 str2 0

-- Exercise 11. Write foldrWith, a function that behaves like foldr except
-- that it takes a function of three arguments and two lists.
t11 = ["(foldrWith (\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])" ~: 6 ~=? (foldrWith (\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])] 
foldrWith :: (a -> b -> c -> c) -> c -> [a] -> [b] -> c
foldrWith f z [] bs = z
foldrWith f z as [] = z
foldrWith f z (a:as) (b:bs) = f a b (foldrWith f z as bs)


-- Exercise 12. Using foldr, write a function mappend such that
-- mappend f xs = concat (map f xs)
t12 = ["(mappend (++!) \"bla\")" ~: "b!l!a!" ~=? (mappend (++"!") ["b","l","a"])] mappend :: (a->[b])->[a]->[b] mappend f xs = []
mappend :: (a -> [b]) -> [a] -> [b]
mappend f xs = foldr fun [] xs where fun x acc = f x ++ acc


-- Exercise 13. Write removeDuplicates, a function that takes a list and removes
-- all of its duplicate elements.
t13 = ["removeDuplicates [1,9,9,2,7,7,7,3]"~: [1,9,2,7,3] ~=? (removeDuplicates [1,9,9,2,7,7,7,3])]
removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs) = if (elem x xs) then removeDuplicates xs else x:removeDuplicates xs


-- Exercise 14. Write a recursive function that takes a value and a list of values
-- and returns True if the value is in the list and False otherwise.
t14 = ["ex14 'b' \"abc\" "~: True ~=? (ex14 'b' "abc")] 
ex14 :: Int -> [Int] -> Bool
ex14 n [] = False	
ex14 n (x:xs)= if n == x then True else ex14 n xs


-- Exercise 15. Write a function that takes two lists, and returns a list of values
-- that appear in both lists. The function should have type intersection
-- :: Eq a => [a] -> [a] -> [a]. (This is one way to implement the
--intersection operation on sets; see Chapter 8.)
t15 = ["(intersection \"abcde\" \"defgh\")"~: ['d','e'] ~=? (intersection "abcde" "defgh")]
intersection :: Eq a => [a] -> [a] -> [a]
intersection [] bs = []
intersection as [] = [] 
intersection (a:as)bs = if (elem a bs) then a:intersection as bs else intersection as bs

-- Exercise 16. Write a function that takes two lists, and returns True if all the
-- elements of the first list also occur in the other. The function should have
-- type isSubset :: Eq a => [a] -> [a] -> Bool. (This is one way to
-- determine whether one set is a subset of another; see Chapter 8.)
t16 = ["(isSubset [2,4] [1,2,3,4,5])" ~: True ~=? (isSubset [2,4] [1,2,3,4,5])]
isSubset :: Eq a => [a] -> [a] -> Bool
isSubset [] set2 = True
isSubset (x:xs) set2 = elem x set2 && isSubset xs set2


-- Exercise 17. Write a recursive function that determines whether a list is
-- sorted.
t17 = ["ex17 [1,3,2,4]" ~: False ~=? (ex17 [1,3,2,4]) , "ex17 [1,2,3,4]" ~: True ~=? (ex17 [1,2,3,4]) ]
ex17 :: Ord a => [a] -> Bool
ex17 [] = True
ex17 [a] = True
ex17 (a:b:bs) = if a < b then True && ex17 (b:bs) else False

-- Exercise 18. Show that the definition of factorial using foldr always produces
-- the same result as the recursive definition given in the previous
-- section.

-- factorial n = foldr (*) 1 [1..n]
-- Por ejemplo 
-- factorial 3 = foldr (*) 1 [1,2,3] = 1 * foldr (*) 1 [2,3] = 1 * 2 * foldr (*) 1 [3] 
--             = 1 * 2 * 3 * foldr (*) 1 [] = 1 * 2 * 3 * 1 = 6


-- factorial n = n * factorial (n-1)
-- factorial 3 = 3 * factorial (3-1) = 3 * (2 * factorial (2-1)) = 3 * (2 * (1 * factorial (1-1))) 
--             = 3 * 2 * 1 * 1 = 6

-- se puede observar que en los casos se llega al mismo resultado, usando la funcion recursiva
-- y usando la funcion foldr.

-- Exercise 19. Using recursion, define last, a function that takes a list and
-- returns a Maybe type that is Nothing if the list is empty.
ex19 :: Eq a => [a] -> Maybe a
ex19 [] = Nothing
ex19 [x] = Just x
ex19 (x:xs) = ex19 xs


-- Exercise 20. Using recursion, write two functions that expect a string containing
-- a number that contains a decimal point (for example, 23.455).
-- The first function returns the whole part of the number (i.e., the part to
-- the left of the decimal point). The second function returns the fractional
-- part (the part to the right of the decimal point).
t20 = ["part1 \"23.455\""~: "23" ~=? (part1 "23.455") ,"part2 \"23.455\""~: "455" ~=? (part2 "23.455")] part1 :: String -> String part1 ns = "" part2 :: String -> String part2 ns = ""
part1 :: String -> String
part1 [] = []
part1 (x:xs) = if x == '.' then [] else x:part1 xs

part2 :: String -> String
part2 [] = []
part2 (x:xs) = if x == '.' then xs else part2 xs 

