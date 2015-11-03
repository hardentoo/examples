module Types

import Data.Vect
import Data.HVect
import Data.Vect.Quantifiers

-- Missing head, tail function for HVect
head : HVect (t::ts) -> t
head (x::_) = x

tail : HVect (t::ts) -> HVect ts
tail (_::xs) = xs

-- TODO: Lists, maps
-- parameter: index
data Field = EInt Nat | EString Nat | EAddress Nat -- | EArray Nat Nat Field

instance Show Field where
  show (EInt n)     = "EINT_" ++ show n
  show (EString n)  = "ESTRING_" ++ show n
  show (EAddress n) = "EADDRESS_" ++ show n
--  show (EArray n l t) = "EARRAY_" ++ show n

index : Field -> Nat
index (EInt n)     = n
index (EString n)  = n
index (EAddress n) = n

size : Field -> Nat
size (EInt _)     = 1
size (EString _)  = 1
size (EAddress _) = 1
--size (EArray _ l t) = l*size t

--Schema definition
Schema : Nat -> Type
Schema k = Vect k Field

InterpField : Field -> Type
InterpField (EInt _) = Integer
InterpField (EString _) = String
InterpField (EAddress _) = String
--InterpField (EArray _ l t) = Vect l (InterpField t)

-- Interpretation function: takes Schema and creates type
Interp : Schema k -> Type
Interp schema = HVect (map InterpField schema)

