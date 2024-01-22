
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
increase_shield_device := class(increase_ability_device):

    @editable IncreaseAmount: float = 100.0
    @editable BaseAmount: float = 100.0
    MAX_ITEM_REQUIRED_COUNT: int = 1000000

    GetNewRequiredCount<override>(IncreasedCount: int):int =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..IncreasedCount - 1 ):
            set NewCount = NewCount * 10
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        return NewCount

    UpdateAbility<override>(Agent: agent,  IncreasedCount: int):void =
        if (FortChar := Agent.GetFortCharacter[]):
            New := BaseAmount + IncreaseAmount * IncreasedCount
            Print("New Shield = {New}")
            FortChar.SetMaxShield(New)
