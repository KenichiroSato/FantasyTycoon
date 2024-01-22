
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
increase_ability_device := class(creative_device):

    @editable Button: conditional_button_device = conditional_button_device{}
    @editable UnlockDevice: unlock_device = unlock_device{}
    @editable ItemCountProvider: conditional_button_device = conditional_button_device{}
    @editable ItemGranter: item_granter_device = item_granter_device{}
    @editable PlayerSpawner:player_spawner_device = player_spawner_device{}
    var BaseItemRequiredCount: int = 100

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void =
        PlayerSpawner.SpawnedEvent.Subscribe(Initialize)
        Button.ActivatedEvent.Subscribe(OnActivated)
        set BaseItemRequiredCount = Button.GetItemCountRequired(0)

    OnActivated(Agent: agent):void =
        if (FortChar := Agent.GetFortCharacter[]):
            IncreasedCount := ItemCountProvider.GetItemCount(Agent, 0)
            Update(Agent, IncreasedCount + 1)
            ItemGranter.GrantItem(Agent)

    Initialize<private>(Agent: agent):void =
        if (FortChar := Agent.GetFortCharacter[]):
            ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
            if (ItemCount > 0):
                Update(Agent, ItemCount)

    Update<private>(Agent: agent,  IncreasedCount: int):void =
        UpdateAbility(Agent, IncreasedCount)
        spawn{UpdateRequiredCountAfterSleep(IncreasedCount)}

    UpdateRequiredCountAfterSleep<private>(IncreasedCount: int)<suspends>:void =
        UnlockDevice.Disable()
        Sleep(3.0)
        UpdateRequiredCount(IncreasedCount)
        UnlockDevice.Enable()
    
    UpdateRequiredCount<private>(IncreasedCount: int):void =
        var NewCount:int = GetNewRequiredCount(IncreasedCount)
        Print("NewCount = {NewCount}")
        Button.SetItemCountRequired(0, NewCount)

    GetNewRequiredCount(IncreasedCount: int):int =
        #should be overriden in subclass
        return BaseItemRequiredCount

    UpdateAbility(Agent: agent,  IncreasedCount: int):void = {}
        #should be overriden in subclass