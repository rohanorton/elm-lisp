module Tests exposing (..)

import Test exposing (..)
import Expect
import Lisp.Parser
import Lisp.Type exposing (LispVal(..))


all : Test
all =
    describe "Lisp parser test"
        [ test "Able to parse a double-quoted string" <|
            \() ->
                Lisp.Parser.parse "\"Hello, World!\""
                    |> Expect.equal (Ok (LispString "Hello, World!"))
        ]
