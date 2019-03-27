module Build.Models exposing
    ( BuildPageType(..)
    , Model
    , StepHeaderType(..)
    )

import Build.Output.Models exposing (OutputModel)
import Concourse
import Concourse.Pagination exposing (Page)
import Login.Login as Login
import Message.Message exposing (Hoverable)
import RemoteData exposing (WebData)
import Routes exposing (Highlight, StepID)
import Time



-- Top level build


type alias Model =
    Login.Model
        { page : BuildPageType
        , now : Maybe Time.Posix
        , disableManualTrigger : Bool
        , history : List Concourse.Build
        , nextPage : Maybe Page
        , currentBuild : WebData CurrentBuild
        , browsingIndex : Int
        , autoScroll : Bool
        , previousKeyPress : Maybe Char
        , shiftDown : Bool
        , previousTriggerBuildByKey : Bool
        , showHelp : Bool
        , highlight : Highlight
        , hoveredElement : Maybe Hoverable
        , hoveredCounter : Int
        , fetchingHistory : Bool
        , scrolledToCurrentBuild : Bool
        }


type alias CurrentBuild =
    { build : Concourse.Build
    , prep : Maybe Concourse.BuildPrep
    , output : Maybe OutputModel
    }


type BuildPageType
    = OneOffBuildPage Concourse.BuildId
    | JobBuildPage Concourse.JobBuildIdentifier


type StepHeaderType
    = StepHeaderPut
    | StepHeaderGet Bool
    | StepHeaderTask
