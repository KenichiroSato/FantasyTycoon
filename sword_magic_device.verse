
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

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        SignalRemote.PrimarySignalEvent.Subscribe(OnSignal)

    OnSignal(Agent: agent):void =
        if (FortChar := Agent.GetFortCharacter[]):
            Position := FortChar.GetViewLocation()
            Rotation := FortChar.GetViewRotation()
            Print("Position={Position}  Rotation={Rotation}")
