module Lisp.Parser exposing (parse)

import Parser exposing (Parser, Error, (|.), (|=))
import Parser.LanguageKit as LK exposing (LineComment(..), MultiComment(NestableComment))
import Lisp.Symbols exposing (isLetter, isDigit, isSymbol)
import Lisp.Type exposing (LispVal(..))
import Lisp.Utils exposing ((|||), (&&&))
import Set exposing (Set)


parse : String -> Result Error LispVal
parse string =
    Parser.run parser string


parser : Parser LispVal
parser =
    Parser.succeed identity
        |. whitespace
        |= Parser.oneOf
            [ string
            , bool
            , atom
            , list
            ]
        |. whitespace


list : Parser LispVal
list =
    Parser.succeed LispList
        |. Parser.symbol "("
        |= Parser.repeat Parser.zeroOrMore atom
        |. Parser.symbol ")"


bool : Parser LispVal
bool =
    Parser.oneOf
        [ Parser.succeed (LispBool True)
            |. Parser.keyword "#t"
        , Parser.succeed (LispBool False)
            |. Parser.keyword "#f"
        ]


{-| Parse a lisp atom.

An atom is a letter or symbol, followed by any number of letters, digits, or
symbols.

    >>> Parser.run string "atom"
    (Ok (LispAtom "atom"))
-}
atom : Parser LispVal
atom =
    Parser.succeed LispAtom
        |= atomString


atomString : Parser String
atomString =
    LK.variable
        (isLetter ||| isSymbol)
        (isLetter ||| isSymbol ||| isDigit)
        keywords


keywords : Set String
keywords =
    Set.fromList []


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



-- IGNORED


whitespace : Parser ()
whitespace =
    LK.whitespace
        { allowTabs = False
        , lineComment = LineComment ";"
        , multiComment = NestableComment "#|" "|#"
        }
