
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
increase_hp_device := class(creative_device):

    @editable Button: conditional_button_device = conditional_button_device{}
    @editable ItemCountProvider: conditional_button_device = conditional_button_device{}
    @editable ItemGranter: item_granter_device = item_granter_device{}
    @editable PlayerSpawner:player_spawner_device = player_spawner_device{}
    @editable IncreaseAmount: float = 100.0
    @editable BaseAmount: float = 100.0
    var BaseItemRequiredCount: int = 100

    MAX_ITEM_REQUIRED_COUNT: int = 1000000

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void =
        PlayerSpawner.SpawnedEvent.Subscribe(Initialize)
        Button.ActivatedEvent.Subscribe(OnActivated)
        set BaseItemRequiredCount = Button.GetItemCountRequired(0)

    OnActivated(Agent: agent):void =
        if (FortChar := Agent.GetFortCharacter[]):
            ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
            Update(FortChar, ItemCount + 1)
            ItemGranter.GrantItem(Agent)

    Initialize<private>(Agent: agent):void =
        if (FortChar := Agent.GetFortCharacter[]):
            ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
            Update(FortChar, ItemCount)

    Update<private>(FortChar: fort_character,  ItemCount: int):void =
        UpdateHp(FortChar, ItemCount)
        spawn{UpdateRequiredCountAfterSleep(ItemCount)}

    UpdateHp<private>(FortChar: fort_character,  ItemCount: int):void =
        New := BaseAmount + IncreaseAmount * ItemCount
        Print("NewHP = {New}")
        FortChar.SetMaxHealth(New)

    UpdateRequiredCountAfterSleep<private>(ItemCount: int)<suspends>:void =
        Sleep(3.0)
        UpdateRequiredCount(ItemCount)
    
    UpdateRequiredCount<private>(ItemCount: int):void =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..ItemCount - 1 ):
            set NewCount = NewCount * 10
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        Print("NewCount = {NewCount}")
        Button.SetItemCountRequired(0, NewCount)
