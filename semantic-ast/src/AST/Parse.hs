{-# LANGUAGE DataKinds, DeriveGeneric, DeriveTraversable, KindSignatures #-}
module AST.Parse
( Err(..)
) where

import GHC.Generics (Generic, Generic1)
import GHC.TypeLits (Symbol, Nat)

-- | An AST node representing a token, indexed by its name and numeric value.
--
-- For convenience, token types are typically used via type synonyms, e.g.:
--
-- @
-- type AnonymousPlus = Token "+" 123
-- @
newtype Err (symName :: Symbol) (symVal :: Nat) a = Token { ann :: a }
  deriving (Eq, Foldable, Functor, Generic, Generic1, Ord, Show, Traversable)
