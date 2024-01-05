
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
unlock_device := class(creative_device):

    @editable Billboard: billboard_device = billboard_device{}
    @editable Beacon: beacon_device = beacon_device{}
    @editable Button: conditional_button_device = conditional_button_device{}
    @editable GameManager: game_manager_device = game_manager_device{}
    @editable AudioPlayer: audio_player_device = audio_player_device{}
    @editable KeepEnableAfterUse: logic = false

    # list of unlock_device that must be activated before this device is enabled.
    @editable DependsDevices: []unlock_device = array{}
    @editable DisableTargets: []unlock_device = array{}

    var DependDeviceActivatedCount:int = 0

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        Billboard.HideText()
        Button.ActivatedEvent.Subscribe(OnActivated)
        SubscribeDependButtonActivation()

    SubscribeDependButtonActivation<private>():void =
        if (DependsDevices.Length > 0):
            for(Index : int = 0..DependsDevices.Length - 1 ):
                if(Target := DependsDevices[Index]):
                    Target.Button.ActivatedEvent.Subscribe(OnDependDeviceActivated)

    OnDependDeviceActivated(Agent: agent):void = 
        set DependDeviceActivatedCount = DependDeviceActivatedCount + 1
        if (DependDeviceActivatedCount = DependsDevices.Length):
            spawn{EnableWithDelay()}

    OnActivated(Agent: agent):void =
        AudioPlayer.Play()
        Cost:int = Button.GetItemCountRequired(0)
        Print("OnActivated Cost={Cost}")
        if (KeepEnableAfterUse = false):
            Disable()
        GameManager.OnPurchased(Cost)
        for(Index : int = 0..DisableTargets.Length - 1 ):
            if(DisableTarget := DisableTargets[Index]):
                    DisableTarget.Disable()

    EnableWithDelay()<suspends>:void =
        Sleep(1.0)
        Enable()

    Enable():void =
        Billboard.ShowText()
        Beacon.Enable()
        Button.Enable()

    Disable():void =
        Billboard.HideText()
        Beacon.Disable()
        Button.Disable()
