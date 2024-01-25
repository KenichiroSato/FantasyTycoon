
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
showcase_manager := class(creative_device):

    @editable ShowCaseProp : creative_prop = creative_prop{}
    @editable ThankYou: creative_prop = creative_prop{}
    @editable LanguageManager: language_manager = language_manager{}

    var InitialPosition<private>: vector3 = vector3{X:=0.0, Y:= 0.0, Z:=0.0}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        set InitialPosition = ShowCaseProp.GetTransform().Translation

    DisplayShowcase(Agent: agent)<suspends>:void =
        SetupPicture(Agent)
        NewLocation := vector3{X := InitialPosition.X, Y := InitialPosition.Y, Z := InitialPosition.Z + 1000.0}
        ShowCaseProp.MoveTo(NewLocation, ShowCaseProp.GetTransform().Rotation, 1.5)

    SetupPicture<private>(Agent: agent):void =
        Lang := LanguageManager.GetCurrentLang(Agent)
        if (Lang = language.Japanese):
            ThankYou.SetMaterial(assets.thankyou_ja_Mat)
        else if (Lang = language.Spanish):
            ThankYou.SetMaterial(assets.thankyou_es_Mat)
        else if (Lang = language.French):
            ThankYou.SetMaterial(assets.thankyou_fr_Mat)
        else:
            ThankYou.SetMaterial(assets.thankyou_Mat)

