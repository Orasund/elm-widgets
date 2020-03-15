module Stateless exposing (Model,Msg,init,update,view)

import Element exposing (Element)
import Element.Input as Input
import Element.Background as Background
import Set exposing (Set)
import Framework.Grid as Grid
import Framework.Button as Button
import Framework.Card as Card
import Framework.Color as Color
import Framework.Group as Group
import Framework.Heading as Heading
import Framework.Input as Input
import Framework.Tag as Tag
import Heroicons.Solid  as Heroicons
import Widget
import Html exposing (Html)
import Html.Attributes as Attributes
import Array exposing (Array)

type alias Model =
    { selected : Maybe Int
    , multiSelected : Set Int
    , isCollapsed : Bool
    , carousel : Int
    }

type Msg =
    ChangedSelected Int
    | ChangedMultiSelected Int
    | ToggleCollapsable Bool
    | SetCarousel Int

init : Model
init =
    { selected = Nothing
    , multiSelected = Set.empty
    , isCollapsed = False
    , carousel = 0
    }

update : Msg -> Model -> (Model,Cmd Msg)
update msg model = 
    case msg of
        ChangedSelected int ->
            ( { model
                | selected = Just int
              }
            , Cmd.none
            )
        
        ChangedMultiSelected int ->
            ( { model
                | multiSelected = 
                     model.multiSelected |> 
                     if model.multiSelected |> Set.member int then
                       Set.remove int
                    else
                        Set.insert int
                }
            , Cmd.none )
        
        ToggleCollapsable bool ->
            ( { model 
                | isCollapsed = bool
                }
                , Cmd.none)
        
        SetCarousel int ->
            ( if (int < 0) || (int > 3) then
                model
              else
                {model
                | carousel = int
                }
            , Cmd.none
            )

select : Model -> Element Msg
select model =
    [ Element.el Heading.h3 <| Element.text "Select"
    , Widget.select
        { selected = model.selected
        , options = [ 1, 2, 42 ]
        , label = String.fromInt >> Element.text
        , onChange = ChangedSelected
        }
        |> List.indexedMap (\i (config,selected)->
            Input.button 
            (Button.simple
            ++ (if i == 0 then
                    Group.left
                else if i == 2 then
                    Group.right
                else
                    Group.center)
            ++ (if selected then
                                Color.primary

                            else
                                []
                           )
            )
            config
        )
        |> Element.row Grid.compact
    ]
        |> Element.column (Grid.simple ++ Card.small)

multiSelect : Model -> Element Msg
multiSelect model =
    [ Element.el Heading.h3 <| Element.text "Multi Select"
    , Widget.multiSelect
        { selected = model.multiSelected
        , options = [ 1, 2, 42 ]
        , label = String.fromInt >> Element.text
        , onChange = ChangedMultiSelected
        }
        |> List.indexedMap (\i (config,selected)->
            Input.button 
            (Button.simple
            ++ (if i == 0 then
                    Group.left
                else if i == 2 then
                    Group.right
                else
                    Group.center)
            ++ (if selected then
                                Color.primary

                            else
                                []
                           )
            )
            config
        )
        |> Element.row Grid.compact
    ]
        |> Element.column (Grid.simple ++ Card.small)
    

collapsable : Model -> Element Msg
collapsable model =
    [Element.el Heading.h3 <| Element.text "Collapsable"
    ,Widget.collapsable
        {onToggle = ToggleCollapsable
        ,isCollapsed = model.isCollapsed
        ,label = Element.row Grid.compact
            [ Element.html <| 
                if model.isCollapsed then 
                    Heroicons.cheveronRight  [ Attributes.width 20] 
                else 
                    Heroicons.cheveronDown [ Attributes.width 20] 
            , Element.el Heading.h4 <|Element.text <| "Title"
            ]
        ,content = Element.text <| "Hello World"
        }
    ]
    |> Element.column (Grid.simple ++ Card.small)

dialog : msg -> Model -> Element msg
dialog showDialog model =
    [ Element.el Heading.h3 <| Element.text "Dialog"
    , Input.button Button.simple
        { onPress = Just showDialog
        , label = Element.text <| "Show Dialog"
        }
    ]
    |> Element.column (Grid.simple ++ Card.small)

carousel : Model -> Element Msg
carousel model =
    [ Element.el Heading.h3 <| Element.text "Carousel"
    , Widget.carousel
            {content = (Color.cyan,[Color.yellow, Color.green , Color.red ]|> Array.fromList)
            ,current = model.carousel
            , label = \c ->
                [ Input.button [Element.centerY]
                    { onPress = Just <| SetCarousel <| model.carousel - 1
                    , label = Heroicons.cheveronLeft [Attributes.width 20]
                        |> Element.html
                    }
                , Element.el 
                    (Card.simple
                    ++  [ Background.color <| c
                        , Element.height <| Element.px <| 100
                        , Element.width <| Element.px <| 100
                        ]
                    ) <| Element.none
                , Input.button [Element.centerY]
                    { onPress = Just <| SetCarousel <| model.carousel + 1
                    , label = Heroicons.cheveronRight [Attributes.width 20]
                    |> Element.html
                    }
                ]
                |> Element.row (Grid.simple ++ [Element.centerX, Element.width<| Element.shrink])
            }
    ]
    |> Element.column (Grid.simple ++ Card.small)
    

view : { msgMapper : Msg -> msg, showDialog : msg} -> Model -> Element msg
view {msgMapper,showDialog} model =
    Element.column (Grid.section)
        [ Element.el Heading.h2 <| Element.text "Stateless Views"
        , "Stateless views are simple functions that view some content. No wiring required."
            |> Element.text
            |> List.singleton
            |> Element.paragraph []
        , Element.wrappedRow
            Grid.simple
            <|
            [ select model |> Element.map msgMapper
            , multiSelect model |> Element.map msgMapper
            , collapsable model |> Element.map msgMapper
            , dialog showDialog model
            , carousel model |> Element.map msgMapper
            ]
        ]