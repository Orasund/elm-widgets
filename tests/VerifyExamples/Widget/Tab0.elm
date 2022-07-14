module VerifyExamples.Widget.Tab0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Widget exposing (..)
import Widget.Material as Material
import Element

type Msg =
    ChangedTab Int

selected : Maybe Int
selected =
    Just 0



spec0 : Test.Test
spec0 =
    Test.test "#tab: \n\n    Widget.tab (Material.tab Material.defaultPalette)\n        { tabs =\n            { selected = selected\n            , options =\n                [ 1, 2, 3 ]\n                    |> List.map\n                        (\\int ->\n                            { text = \"Tab \" ++ (int |> String.fromInt)\n                            , icon = always Element.none\n                            }\n                        )\n            , onSelect =\n                (\\s ->\n                    if s >= 0 && s <= 2 then\n                        Just (ChangedTab s)\n                    else\n                        Nothing\n                )\n            }\n        , content =\n            (\\s ->\n                case s of\n                    Just 0 ->\n                        \"This is Tab 1\" |> Element.text\n                    Just 1 ->\n                        \"This is the second tab\" |> Element.text\n                    Just 2 ->\n                        \"The third and last tab\" |> Element.text\n                    _ ->\n                        \"Please select a tab\" |> Element.text\n            )\n        }\n        |> always \"Ignore this line\"\n    --> \"Ignore this line\"" <|
        \() ->
            Expect.equal
                (
                Widget.tab (Material.tab Material.defaultPalette)
                    { tabs =
                        { selected = selected
                        , options =
                            [ 1, 2, 3 ]
                                |> List.map
                                    (\int ->
                                        { text = "Tab " ++ (int |> String.fromInt)
                                        , icon = always Element.none
                                        }
                                    )
                        , onSelect =
                            (\s ->
                                if s >= 0 && s <= 2 then
                                    Just (ChangedTab s)
                                else
                                    Nothing
                            )
                        }
                    , content =
                        (\s ->
                            case s of
                                Just 0 ->
                                    "This is Tab 1" |> Element.text
                                Just 1 ->
                                    "This is the second tab" |> Element.text
                                Just 2 ->
                                    "The third and last tab" |> Element.text
                                _ ->
                                    "Please select a tab" |> Element.text
                        )
                    }
                    |> always "Ignore this line"
                )
                (
                "Ignore this line"
                )