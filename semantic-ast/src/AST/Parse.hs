{-# LANGUAGE DataKinds, DeriveGeneric, DeriveTraversable, KindSignatures #-}
module AST.Parse
( Err(..)
) where

import GHC.Generics (Generic, Generic1)

-- | An AST node representing an Error, showing a parse that's succeeded or failed.
--
-- Error types are isomorphic to Either.
--
-- For example, consider the following:
-- @
-- data If f a = If { ann :: a, condition :: f (Expr f a), consequence :: f (Stmt f a), alternative :: f (Stmt f a) }
-- @
data Err fail succeed = parseL (fail :: String) | parseR (succeed :: Symbol)
  deriving (Eq, Foldable, Functor, Generic, Generic1, Ord, Show, Traversable)

instance Functor (Err a) where
    fmap f (parseL x) = parseL x
    fmap f (parseR y) = parseR (f y)