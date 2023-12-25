
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
sword_magic_device := class(creative_device):

    @editable SignalRemote:signal_remote_manager_device = signal_remote_manager_device{}
    @editable Sword: creative_prop = creative_prop{}
    @editable Explosive: explosive_device = explosive_device{}

    DistanceFromPlayer: float = 1000.0 #cm
    AttackDuration: float = 0.5

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        SignalRemote.PrimarySignalEvent.Subscribe(OnSignal)

    OnSignal(Agent: agent):void =
        Explosive.Reset()
            spawn{MoveSword(Agent)}

    MoveSword<private>(Agent: agent)<suspends>:void =
        if (FortChar := Agent.GetFortCharacter[]):
            SetSword(FortChar)
            CharPosition := FortChar.GetTransform().Translation
            CharRotation := FortChar.GetTransform().Rotation
            CharAngle := CharRotation.GetAngle()
            CosVal:= Cos(CharAngle)
            SinVal:= Sin(CharAngle)
            SwordLocation := Sword.GetTransform().Translation

            Print("CharRotation={CharRotation} Angle={CharAngle}  CosVal={CosVal} Sin={SinVal}")
            NewX :float = CharPosition.X + DistanceFromPlayer*CosVal
            NewY :float = CharPosition.Y + DistanceFromPlayer*SinVal*CharRotation.GetAxis().Z
            NewZ :float = CharPosition.Z - 1300.0
            NewLocation := vector3{X := NewX, Y := NewY, Z := NewZ}
            Sword.MoveTo(NewLocation, Sword.GetTransform().Rotation, AttackDuration)
            Explosive.Explode(Agent)

    SetSword<private>(FortChar: fort_character)<suspends>:void =
        CharPosition := FortChar.GetTransform().Translation
        CharRotation := FortChar.GetTransform().Rotation
        NewLocation := vector3{X := CharPosition.X, Y := CharPosition.Y, Z := CharPosition.Z + 1000.0}
        if (Sword.TeleportTo[NewLocation, CharRotation]):
            Print("Reload")


