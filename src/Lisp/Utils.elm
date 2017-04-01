module Lisp.Utils exposing (either, (|||), both, (&&&))

{-| Some utility functions.
-}


{-| Returns true if either function evaluates to true.
-}
either : (a -> Bool) -> (a -> Bool) -> a -> Bool
either conditionA conditionB val =
    conditionA val || conditionB val


{-| Infix version of either
-}
(|||) : (a -> Bool) -> (a -> Bool) -> a -> Bool
(|||) =
    either


{-| Returns true if both functions evaluates to true.
-}
both : (a -> Bool) -> (a -> Bool) -> a -> Bool
both conditionA conditionB val =
    conditionA val && conditionB val


{-| Infix version of either
-}
(&&&) : (a -> Bool) -> (a -> Bool) -> a -> Bool
(&&&) =
    both
