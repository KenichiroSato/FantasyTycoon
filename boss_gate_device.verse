
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
boss_gate_device := class(creative_device, unlock_consultant):

    @editable UnlockDevice: unlock_device = unlock_device{}
    @editable Button: conditional_button_device = conditional_button_device{}
    @editable Barrier: barrier_device = barrier_device{}
    @editable ItemCountProvider: conditional_button_device = conditional_button_device{}
    @editable ItemGranter: item_granter_device = item_granter_device{}
    @editable PlayerSpawner:player_spawner_device = player_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        PlayerSpawner.SpawnedEvent.Subscribe(Initialize)
        Button.ActivatedEvent.Subscribe(OnActivated)
        UnlockDevice.SetUnlockConsultant(Self)

    OnActivated(Agent: agent):void =
        ItemGranter.GrantItem(Agent)
        Barrier.Disable()

    Initialize<private>(Agent: agent):void =
        ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
        if (ItemCount > 0):
            spawn{HideUnlockDeviceAfterSleep()}

    HideUnlockDeviceAfterSleep<private>()<suspends>:void =
        #ゲーム起動直後、 OnBeginの順番依存で、unlock_deviceのOnBeginのEnableが呼ばれるので2秒待つ
        Sleep(2.0)
        Barrier.Disable()
        UnlockDevice.Disable()
        UnlockDevice.HideButton()

    shouldEnableDevice<override>(Agent: agent):logic =
        ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
        if (ItemCount > 0):
            return true
        else :
            return false
