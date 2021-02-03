module VerifyExamples.Widget.Modal0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Widget exposing (..)
import Element

type Msg
    = Close





spec0 : Test.Test
spec0 =
    Test.test "#modal: \n\n    Element.layout\n        (modal\n            { onDismiss = Just Close\n            , content =\n                Element.text \"Click outside this window to close it.\"\n            }\n        )\n        |> always \"Ignore this line\"\n    --> \"Ignore this line\"" <|
        \() ->
            Expect.equal
                (
                Element.layout
                    (modal
                        { onDismiss = Just Close
                        , content =
                            Element.text "Click outside this window to close it."
                        }
                    )
                    |> always "Ignore this line"
                )
                (
                "Ignore this line"
                )