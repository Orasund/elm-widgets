module VerifyExamples.Widget.ItemList0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Widget exposing (..)
import Widget.Material as Material
import Element







spec0 : Test.Test
spec0 =
    Test.test "#itemList: \n\n    [ Widget.textItem (Material.textItem Material.defaultPalette)\n        { onPress = Nothing\n        , icon = always Element.none\n        , text = \"Item\"\n        , content =\n            \\{ size, color } ->\n                Element.none\n        }\n    , \"Header\"\n        |> Widget.headerItem (Material.insetHeader Material.defaultPalette )\n    , Widget.textItem (Material.textItem Material.defaultPalette)\n        { onPress = Nothing\n        , icon = always Element.none\n        , text = \"Item\"\n        , content =\n            \\{ size, color } ->\n                Element.none\n        }\n    ]\n        |> Widget.itemList (Material.cardColumn Material.defaultPalette)\n        |> always \"Ignore this line\"\n    --> \"Ignore this line\"" <|
        \() ->
            Expect.equal
                (
                [ Widget.textItem (Material.textItem Material.defaultPalette)
                    { onPress = Nothing
                    , icon = always Element.none
                    , text = "Item"
                    , content =
                        \{ size, color } ->
                            Element.none
                    }
                , "Header"
                    |> Widget.headerItem (Material.insetHeader Material.defaultPalette )
                , Widget.textItem (Material.textItem Material.defaultPalette)
                    { onPress = Nothing
                    , icon = always Element.none
                    , text = "Item"
                    , content =
                        \{ size, color } ->
                            Element.none
                    }
                ]
                    |> Widget.itemList (Material.cardColumn Material.defaultPalette)
                    |> always "Ignore this line"
                )
                (
                "Ignore this line"
                )