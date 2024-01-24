
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
heal_magic_device := class(creative_device):

    @editable SignalRemote:signal_remote_manager_device = signal_remote_manager_device{}
    @editable Vfx: vfx_follow_player_device = vfx_follow_player_device{}
    @editable HealDevice: health_powerup_device = health_powerup_device{}
    var HealAmount: float = 100.0

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        SignalRemote.PrimarySignalEvent.Subscribe(OnSignal)

    OnSignal(Agent: agent):void =
        Heal(Agent)

    SetHealAmount(Amount: float):void =
        set HealAmount = Amount
        HealDevice.SetMagnitude(Amount)

    Heal(Agent : agent) :void =
        if (FortniteCharacter : fort_character = Agent.GetFortCharacter[]):
            Print("Heal")
            HealDevice.Pickup(Agent)
