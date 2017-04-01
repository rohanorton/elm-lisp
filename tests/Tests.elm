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
        , test "Able to parse atom" <|
            \() ->
                Lisp.Parser.parse "atomic123"
                    |> Expect.equal (Ok (LispAtom "atomic123"))
        , test "Able to parse empty list" <|
            \() ->
                Lisp.Parser.parse "()"
                    |> Expect.equal (Ok (LispList []))
        , test "Able to parse list with a single atom inside" <|
            \() ->
                Lisp.Parser.parse "(one)"
                    |> Expect.equal (Ok (LispList [ LispAtom "one" ]))
        , test "Able to parse list with multiple atoms inside" <|
            \() ->
                Lisp.Parser.parse "(one two three)"
                    |> Expect.equal (Ok (LispList [ LispAtom "one", LispAtom "two", LispAtom "three" ]))
        , test "Able to parse bool: true" <|
            \() ->
                Lisp.Parser.parse "#t"
                    |> Expect.equal (Ok (LispBool True))
        , test "Able to parse bool: false" <|
            \() ->
                Lisp.Parser.parse "#f"
                    |> Expect.equal (Ok (LispBool False))
        , test "Ignores whitespace" <|
            \() ->
                Lisp.Parser.parse """

                ; This is a singleline commment.

                "Hello, World!"

                #| I
                   am a multiline
                   block comment |#

                """
                    |> Expect.equal (Ok (LispString "Hello, World!"))
        ]
