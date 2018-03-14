module Lisp.Type exposing (LispVal(..))


type LispVal
    = LispAtom String
    | LispList (List LispVal)
    | LispNum Float
    | LispString String
    | LispBool Bool
