module Internal.Material.List exposing
    ( buttonRow
    , cardColumn
    , column
    , row
    )

import Element
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Internal.List exposing (ColumnStyle, RowStyle)
import Internal.Material.Palette exposing (Palette)
import Widget.Material.Color as MaterialColor


row : RowStyle msg
row =
    { elementRow =
        [ Element.paddingXY 0 8
        , Element.spacing 8
        ]
    , content =
        { element = []
        , ifSingleton = []
        , ifFirst = []
        , ifLast = []
        , otherwise = []
        }
    }


column : ColumnStyle msg
column =
    { elementColumn =
        [ Element.paddingXY 0 8
        , Element.spacing 8
        ]
    , content =
        { element = []
        , ifSingleton = []
        , ifFirst = []
        , ifLast = []
        , otherwise = []
        }
    }


buttonRow : RowStyle msg
buttonRow =
    { elementRow = []
    , content =
        { element = []
        , ifSingleton =
            [ Border.rounded 2
            ]
        , ifFirst =
            [ Border.roundEach
                { topLeft = 2
                , topRight = 0
                , bottomLeft = 2
                , bottomRight = 0
                }
            ]
        , ifLast =
            [ Border.roundEach
                { topLeft = 0
                , topRight = 2
                , bottomLeft = 0
                , bottomRight = 2
                }
            ]
        , otherwise =
            [ Border.rounded 0
            ]
        }
    }


cardColumn : Palette -> ColumnStyle msg
cardColumn palette =
    { elementColumn =
        [ Element.width <| Element.fill
        , Element.mouseOver <|
            [ Border.shadow <| MaterialColor.shadow 4 ]
        , Element.alignTop
        , Border.rounded 4
        ]
    , content =
        { element =
            [ Element.paddingXY 16 12
            , Element.height <| Element.minimum 48 <| Element.shrink
            , palette.surface
                |> MaterialColor.fromColor
                |> Background.color
            , palette.surface
                |> MaterialColor.accessibleTextColor
                |> MaterialColor.fromColor
                |> Font.color
            , palette.on.surface
                |> MaterialColor.scaleOpacity 0.14
                |> MaterialColor.fromColor
                |> Border.color
            , Element.width <| Element.minimum 344 <| Element.fill
            ]
        , ifSingleton =
            [ Border.rounded 4
            , Border.width 1
            ]
        , ifFirst =
            [ Border.roundEach
                { topLeft = 4
                , topRight = 4
                , bottomLeft = 0
                , bottomRight = 0
                }
            , Border.widthEach
                { top = 1
                , left = 1
                , right = 1
                , bottom = 0
                }
            ]
        , ifLast =
            [ Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 4
                , bottomRight = 4
                }
            , Border.widthEach
                { top = 0
                , left = 1
                , right = 1
                , bottom = 1
                }
            ]
        , otherwise =
            [ Border.rounded 0
            , Border.widthEach
                { top = 0
                , left = 1
                , right = 1
                , bottom = 0
                }
            ]
        }
    }