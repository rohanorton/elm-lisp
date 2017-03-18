module Lisp.Symbols exposing (isLetter, isDigit, isSymbol)

import Char
import Lisp.Utils exposing ((|||), (&&&))


isLetter : Char -> Bool
isLetter =
    Char.isUpper ||| Char.isLower


isDigit : Char -> Bool
isDigit =
    Char.isDigit


isSymbol : Char -> Bool
isSymbol c =
    List.member c symbols


symbols : List Char
symbols =
    [ '!'
    , '#'
    , '$'
    , '%'
    , '&'
    , '|'
    , '*'
    , '+'
    , '-'
    , '/'
    , ':'
    , '<'
    , '='
    , '>'
    , '?'
    , '@'
    , '^'
    , '_'
    , '~'
    ]
