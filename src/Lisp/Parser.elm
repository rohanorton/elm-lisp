module Lisp.Parser exposing (parse)

import Parser exposing (Parser, Error, (|.), (|=))
import Lisp.Type exposing (LispVal(..))


parse : String -> Result Error LispVal
parse string =
    Parser.run parser string


parser : Parser LispVal
parser =
    string


{-| Parse a lisp string:

    >>> Parser.run string "\"Hello, World!\""
    (Ok (LispString "Helo, world!"))

-}
string : Parser LispVal
string =
    Parser.succeed LispString
        |. Parser.symbol "\""
        |= Parser.keep Parser.zeroOrMore (\char -> char /= '"')
        |. Parser.symbol "\""
