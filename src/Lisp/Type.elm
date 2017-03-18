module Lisp.Type exposing (LispVal(..))


type LispVal
    = LispAtom String
    | LispList (List LispVal)
    | LispNum Int
    | LispString String
    | LispBool Bool
