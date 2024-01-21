
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }
# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
prop_appear_device := class(creative_device):

    @editable Button: conditional_button_device = conditional_button_device{}
    @editable UnlockDevice: unlock_device = unlock_device{}
    @editable ItemCountProvider: conditional_button_device = conditional_button_device{}
    @editable ItemGranter: item_granter_device = item_granter_device{}
    @editable PlayerSpawner:player_spawner_device = player_spawner_device{}
    @editable Prop: creative_prop = creative_prop{}
    @editable EnableDevicesAfterAppear: []unlock_device = array{}

    @editable MoveDistance: float = 3000.0
    var IsInitialized: logic = false

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        HideProp()
        PlayerSpawner.SpawnedEvent.Subscribe(Initialize)
        Button.ActivatedEvent.Subscribe(OnActivated)

    OnActivated(Agent: agent):void =
        if (FortChar := Agent.GetFortCharacter[]):
            ItemGranter.GrantItem(Agent)
            spawn{AppearProp(Agent)}

    Initialize<private>(Agent: agent):void =
        if (IsInitialized = true):
            return
        set IsInitialized = true
        if (FortChar := Agent.GetFortCharacter[]):
            ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
            if (ItemCount > 0):
                UnlockDevice.Disable()
                spawn{AppearProp(Agent)}

    HideProp<private>()<suspends>:void =
        PropLocation := Prop.GetTransform().Translation
        NewLocation := vector3{X := PropLocation.X, Y := PropLocation.Y, Z := PropLocation.Z - MoveDistance}
        if (Prop.TeleportTo[NewLocation, Prop.GetTransform().Rotation]):
            Print("Hide Prop")

    AppearProp<private>(Agent: agent)<suspends>:void =
        Print("Appear Prop")
        PropLocation := Prop.GetTransform().Translation
        NewLocation := vector3{X := PropLocation.X, Y := PropLocation.Y, Z := PropLocation.Z + MoveDistance}
        Prop.MoveTo(NewLocation, Prop.GetTransform().Rotation, 1.0)
        EnableDevices(Agent)
    
    EnableDevices<private>(Agent: agent):void =
        for(Index : int = 0..EnableDevicesAfterAppear.Length - 1 ):
            if(EnableTarget := EnableDevicesAfterAppear[Index]):
                EnableTarget.EnableIfNeed(Agent)



