module Main exposing (main)

import Application.Application as Application
import Browser
import Browser.Navigation as Navigation
import Concourse
import Message.Callback as Callback
import Message.Effects as Effects
import Message.Subscription as Subscription
import Message.TopLevelMessage as Msgs


main : Program Application.Flags Application.Model Msgs.TopLevelMessage
main =
    Browser.application
        { init = \flags url key -> Application.init flags key url |> effectsToCmd
        , update = \msg -> Application.update msg >> effectsToCmd
        , view = Application.view
        , subscriptions = Application.subscriptions >> subscriptionsToSub
        , onUrlChange = Application.locationMsg
        , onUrlRequest = always (Msgs.Callback Callback.EmptyCallback)
        }


effectsToCmd :
    ( Application.Model, List Effects.Effect )
    -> ( Application.Model, Cmd Msgs.TopLevelMessage )
effectsToCmd ( model, effs ) =
    ( model
    , List.map (effectToCmd model.csrfToken model.key) effs |> Cmd.batch
    )


effectToCmd :
    Concourse.CSRFToken
    -> Navigation.Key
    -> Effects.Effect
    -> Cmd Msgs.TopLevelMessage
effectToCmd csrfToken key eff =
    Effects.runEffect eff key csrfToken |> Cmd.map Msgs.Callback


subscriptionsToSub : List Subscription.Subscription -> Sub Msgs.TopLevelMessage
subscriptionsToSub =
    List.map Subscription.runSubscription >> Sub.batch >> Sub.map Msgs.DeliveryReceived
