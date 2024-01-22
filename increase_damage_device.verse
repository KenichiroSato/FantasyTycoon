
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
increase_damage_device := class(increase_ability_device):

    @editable DamageAmplifier:damage_amplifier_powerup_device = damage_amplifier_powerup_device{}
    @editable BaseAmount: float = 0.1
    MAX_ITEM_REQUIRED_COUNT: int = 1000000

    GetNewRequiredCount<override>(IncreasedCount: int):int =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..IncreasedCount - 1 ):
            set NewCount = NewCount * 10
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        return NewCount

    UpdateAbility<override>(Agent: agent,  IncreasedCount: int):void =
        AmpValue := BaseAmount * IncreasedCount * 5.0
        DamageAmplifier.SetMagnitude(AmpValue)
        Print("New AmpValue = {AmpValue}")
