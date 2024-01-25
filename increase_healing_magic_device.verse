
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
increase_healing_magic_device := class(increase_ability_device):

    @editable IncreaseAmount: float = 10.0
    @editable HealMagicDevice: heal_magic_device = heal_magic_device{}
    MAX_ITEM_REQUIRED_COUNT: int = 1000000
    @editable Barrier: barrier_device = barrier_device{}
    @editable Billboard: billboard_device = billboard_device{}
    @editable HudManager: hud_manager_device = hud_manager_device{}

    GetNewRequiredCount<override>(IncreasedCount: int):int =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..IncreasedCount - 1 ):
            set NewCount = NewCount * 10
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        return NewCount

    UpdateAbility<override>(Agent: agent,  IncreasedCount: int):void =
        Barrier.Disable()
        New := IncreaseAmount * IncreasedCount
        HealMagicDevice.SetHealAmount(New)
        BillboardMessage := "Healing magic level up"
        Billboard.SetText(StringToMessage(BillboardMessage))
        HudManager.UpdateHealingMagicLevel(IncreasedCount)

    StringToMessage<localizes>(value:string) : message = "{value}"
