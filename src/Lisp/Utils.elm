module Lisp.Utils exposing ((|||), (&&&))


(|||) : (a -> Bool) -> (a -> Bool) -> a -> Bool
(|||) conditionA conditionB val =
    conditionA val || conditionB val


(&&&) : (a -> Bool) -> (a -> Bool) -> a -> Bool
(&&&) conditionA conditionB val =
    conditionA val || conditionB val
