module File exposing (read)

import Path exposing (..)
import Task exposing (Task)


read : Path Abs -> Task String ()
read =
    Debug.crash "TODO"


type alias Model =
    { cwd : String }


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        cwd =
            Path.absolute +/ model.cwd

        elmPackagePath =
            cwd +/ "elm-package.json"

        testElmPackagePath =
            cwd +/ "tests" +/ "elm-package.json"
    in
    ( model, Cmd.none )
