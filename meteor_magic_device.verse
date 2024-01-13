using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
meteor_magic_device := class(creative_device):

    @editable SignalRemote:signal_remote_manager_device = signal_remote_manager_device{}
    #@editable Meteor: creative_prop = creative_prop{}
    #@editable Explosive: explosive_device = explosive_device{}

    var Meteor: creative_prop = creative_prop{}
    var Explosive: explosive_device = explosive_device{}

    var DistanceFromPlayer: float = 4000.0 #cm
    var DistanceFromGround: float = 200.0
    var BehindFromPlayer: float = 1000.0
    var AboveFromPlayer: float = 500.0
    var AngleBehindPlayer: float = 20.0
    var AttackDuration: float = 0.8

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        SignalRemote.PrimarySignalEvent.Subscribe(OnSignal)

    SetCurrentAttackEffect(Effect: attack_effect):void =
        set Meteor = Effect.Prop
        set Explosive = Effect.Explosive
        set DistanceFromPlayer = Effect.DistanceFromPlayer
        set DistanceFromGround = Effect.DistanceFromGround
        set BehindFromPlayer = Effect.BehindFromPlayer
        set AboveFromPlayer = Effect.AboveFromPlayer
        set AngleBehindPlayer = Effect.AngleBehindPlayer
        set AttackDuration = Effect.AttackDuration

    OnSignal(Agent: agent):void =
        Explosive.Reset()
            spawn{MoveMeteor(Agent)}

    MoveMeteor<private>(Agent: agent)<suspends>:void =
        if (FortChar := Agent.GetFortCharacter[]):
            SetMeteor(FortChar)
            CharPosition := FortChar.GetTransform().Translation
            CharRotation := FortChar.GetTransform().Rotation
            CharAngle := CharRotation.GetAngle()
            CosVal:= Cos(CharAngle)
            SinVal:= Sin(CharAngle)
            MeteorLocation := Meteor.GetTransform().Translation

            Print("CharRotation={CharRotation} Angle={CharAngle}  CosVal={CosVal} Sin={SinVal}")
            NewX :float = CharPosition.X + DistanceFromPlayer*CosVal
            NewY :float = CharPosition.Y + DistanceFromPlayer*SinVal*CharRotation.GetAxis().Z
            NewZ :float = CharPosition.Z - DistanceFromGround
            NewLocation := vector3{X := NewX, Y := NewY, Z := NewZ}
            Meteor.MoveTo(NewLocation, Meteor.GetTransform().Rotation, AttackDuration)
            Explosive.Explode(Agent)
            HideMeteor()

    SetMeteor<private>(FortChar: fort_character)<suspends>:void =
        CharPosition := FortChar.GetTransform().Translation
        CharRotation := FortChar.GetTransform().Rotation
        CharAngle := CharRotation.GetAngle()*CharRotation.GetAxis().Z - 3.14 * AngleBehindPlayer/180.0
        CosVal:= Cos(CharAngle)
        SinVal:= Sin(CharAngle)

        Print("CharRotation={CharRotation} Angle={CharAngle}  CosVal={CosVal} Sin={SinVal}")
        NewX :float = CharPosition.X - BehindFromPlayer*CosVal
        NewY :float = CharPosition.Y - BehindFromPlayer*SinVal
        NewZ :float = CharPosition.Z + AboveFromPlayer
        NewLocation := vector3{X := NewX, Y := NewY, Z := NewZ}
        if (Meteor.TeleportTo[NewLocation, CharRotation]):
            Print("Reload")

    HideMeteor<private>()<suspends>:void =
        CurrentPosition := Meteor.GetTransform().Translation
        CurrentRotation := Meteor.GetTransform().Rotation
        NewLocation := vector3{X := CurrentPosition.X, Y := CurrentPosition.Y, Z := CurrentPosition.Z - 5000.0}
        if (Meteor.TeleportTo[NewLocation, CurrentRotation]):
            Print("Hide")
