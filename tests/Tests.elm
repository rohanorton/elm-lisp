module Tests exposing (..)

import Test exposing (..)
import Expect
import Lisp.Parser
import Lisp.Type exposing (LispVal(..))


all : Test
all =
    describe "Lisp parser test"
        [ test "Parser function exists" <|
            \() ->
                Lisp.Parser.parse ""
                    |> Expect.equal (Ok (LispBool True))
        ]
