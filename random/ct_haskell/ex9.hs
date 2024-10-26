{-# language FlexibleInstances #-}
{-# language MultiParamTypeClasses #-}
{-# language FunctionalDependencies #-}

-- using the walking arrow category 2 from ex.2


class Category objects morphisms | morphisms -> objects where
	domain :: morphisms -> objects
	codomain :: morphisms -> objects
	composition :: morphisms -> morphisms -> Maybe morphisms
	identity :: objects -> morphisms


data Ob = Ob0 | Ob1 deriving (Show, Eq)
data Mor = Id0 | F | Id1 deriving (Show, Eq)

dom :: Mor -> Ob
dom Id0 = Ob0
dom F = Ob0
dom Id1 = Ob1

codom :: Mor -> Ob
codom Id0 = Ob0
codom F = Ob1
codom Id1 = Ob1

ident :: Ob -> Mor 
ident Ob0 = Id0
ident Ob1 = Id1

comp :: Mor -> Mor -> Maybe Mor 
comp Id0 Id0 = Just Id0
comp Id0 F = Just F
comp Id0 Id1 = Nothing
comp F Id0 = Nothing
comp F F = Nothing
comp F Id1 = Just F 
comp Id1 Id0 = Nothing
comp Id1 F = Nothing
comp Id1 Id1 = Just Id1

instance Category Ob Mor where
	domain = dom
	codomain = codom
	identity = ident 
	composition = comp 

main = do
    -- Test identity morphisms
    putStrLn "Identity morphisms:"
    print (identity Ob0 :: Mor)  -- Should print: Id0
    print (identity Ob1 :: Mor)  -- Should print: Id1

    -- Test composition of morphisms
    putStrLn "\nCompositions:"
    print (composition Id0 Id0)  -- Should print: Just Id0
    print (composition Id0 F)    -- Should print: Just F
    print (composition F Id1)    -- Should print: Just F
    print (composition F F)      -- Should print: Nothing

    -- Test domain and codomain
    putStrLn "\nDomains and Codomains:"
    print (domain F)    -- Should print: Ob0
    print (codomain F)  -- Should print: Ob1
    print (domain Id0)  -- Should print: Ob0
    print (codomain Id0)-- Should print: Ob0