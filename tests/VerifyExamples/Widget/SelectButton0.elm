module VerifyExamples.Widget.SelectButton0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Widget exposing (..)
import Element
import Widget.Material as Material

type Msg
    = ChangedSelected Int





spec0 : Test.Test
spec0 =
    Test.test "#selectButton: \n\n    { selected = Just 1\n    , options =\n        [ 1, 2, 42 ]\n            |> List.map\n                (\\int ->\n                    { text = String.fromInt int\n                    , icon = always Element.none\n                    }\n                )\n    , onSelect = (\\i -> Just <| ChangedSelected i)\n    }\n        |> Widget.select\n        |> Widget.buttonRow\n            { elementRow = Material.buttonRow\n            , content = Material.outlinedButton Material.defaultPalette\n            }\n        |> always \"Ignore this line\"\n    --> \"Ignore this line\"" <|
        \() ->
            Expect.equal
                (
                { selected = Just 1
                , options =
                    [ 1, 2, 42 ]
                        |> List.map
                            (\int ->
                                { text = String.fromInt int
                                , icon = always Element.none
                                }
                            )
                , onSelect = (\i -> Just <| ChangedSelected i)
                }
                    |> Widget.select
                    |> Widget.buttonRow
                        { elementRow = Material.buttonRow
                        , content = Material.outlinedButton Material.defaultPalette
                        }
                    |> always "Ignore this line"
                )
                (
                "Ignore this line"
                )