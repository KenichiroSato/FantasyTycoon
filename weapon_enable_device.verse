
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
weapon_enable_device := class(creative_device):

    @editable Button: conditional_button_device = conditional_button_device{}
    @editable Barrier: barrier_device = barrier_device{}
    @editable ItemCountProvider: conditional_button_device = conditional_button_device{}
    @editable ItemGranter: item_granter_device = item_granter_device{}
    @editable PlayerSpawner:player_spawner_device = player_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void =
        PlayerSpawner.SpawnedEvent.Subscribe(Initialize)
        Button.ActivatedEvent.Subscribe(OnActivated)

    OnActivated(Agent: agent):void =
        ItemGranter.GrantItem(Agent)
        Barrier.Disable()

    Initialize<private>(Agent: agent):void =
        ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
        if (ItemCount > 0):
            Button.Disable()
            Barrier.Disable()
