
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
increase_hp_device := class(creative_device):

    @editable Button: conditional_button_device = conditional_button_device{}
    @editable Amount: float = 100.0

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void =
        Button.ActivatedEvent.Subscribe(OnActivated)

    OnActivated(Agent: agent):void =
        if (FortChar := Agent.GetFortCharacter[]):
            Current := FortChar.GetMaxHealth()
            New := Current + Amount
            Print("NewHP = {New}")
            FortChar.SetMaxHealth(New)
