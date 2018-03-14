module Lisp.Type exposing (LispVal(..))


type LispVal
    = LispAtom String
    | LispList (List LispVal)
    | LispQuotedList (List LispVal)
    | LispNum Float
    | LispString String
    | LispBool Bool
