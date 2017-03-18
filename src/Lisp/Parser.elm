module Lisp.Parser exposing (parse)

import Parser exposing (Parser, Error)
import Lisp.Type exposing (LispVal(..))


parse : String -> Result Error LispVal
parse string =
    Parser.run parser string


parser : Parser LispVal
parser =
    Parser.succeed (LispBool True)
