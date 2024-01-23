
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Random }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
game_manager_device := class(creative_device):

    @editable CreatureSpawners: []creature_spawner_device = array{}
    
    @editable SpawnDevice:player_spawner_device = player_spawner_device{}
    @editable HudManager:hud_manager_device = hud_manager_device{}
    @editable VendingMachines1: vending_machine_device = vending_machine_device{}
    @editable VendingMachines10: []vending_machine_device = array{}
    @editable VendingMachines100: []vending_machine_device = array{}
    @editable InitialItemSpawner: item_spawner_device = item_spawner_device{}
    @editable var CurrentGranter: item_granter_device = item_granter_device{}

    @editable BgmManager: bgm_manager = bgm_manager{}
    @editable AccoladeBoss: accolades_device = accolades_device{}
    @editable AccoladeLasBoss: accolades_device = accolades_device{}
    
    var CurrentAgent: ?agent = false
    var GoldPerKill:int = 1
    var CurrentGold:int = 0

    @editable GoldCountProvider: conditional_button_device = conditional_button_device{}
    var IsInitialized: logic = false

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        Print("GameManager OnBegin")
        for(Index : int = 0..CreatureSpawners.Length - 1 ):
            if(CreatureSpawner := CreatureSpawners[Index]):
                CreatureSpawner.EliminatedEvent.Subscribe(OnCreatureEliminated)
        SpawnDevice.SpawnedEvent.Subscribe(OnPlayerSpawned)
        SubscribeVindingMachines()
        InitialItemSpawner.ItemPickedUpEvent.Subscribe(OnInitialGoldPickedUp)
        UpdateGoldPerKill(GoldPerKill)
        BgmManager.PlayNormalBgm()
        
    OnInitialGoldPickedUp(Agent: agent):void =
        set CurrentGold = CurrentGold + 1
        ShowGold()
        
    UpdateGoldPerKill(NewValue: int):void =
        set GoldPerKill = NewValue
        HudManager.ShowGoldPerKill(GoldPerKill)

    SetGoldGranter(Granter: item_granter_device):void =
        set CurrentGranter = Granter

    SubscribeVindingMachines():void =
        VendingMachines1.ItemSpawnedEvent.Subscribe(OnPurchased1)
        for(Index : int = 0..VendingMachines10.Length - 1 ):
            if(Machine := VendingMachines10[Index]):
                Machine.ItemSpawnedEvent.Subscribe(OnPurchased10)
        for(Index : int = 0..VendingMachines100.Length - 1 ):
            if(Machine := VendingMachines100[Index]):
                Machine.ItemSpawnedEvent.Subscribe(OnPurchased100)


    OnPurchased1(Agent: agent):void =
        OnPurchased(1)
        BgmManager.PlayNormalBgm()

    OnPurchased10(Agent: agent):void =
        OnPurchased(10)

    OnPurchased100(Agent: agent):void =
        OnPurchased(100)

    OnPurchased(value: int):void =
        set CurrentGold = CurrentGold - value
        ShowGold()
    
    OnPlayerSpawned(Agent: agent):void=
        set CurrentAgent = option{Agent}
        if (IsInitialized = false):
            InitializeGold(Agent)

    InitializeGold<private>(Agent: agent):void =
        set CurrentGold = GoldCountProvider.GetItemCount(Agent, 0)
        Print("InitializeGold {CurrentGold}")
        ShowGold()
        set IsInitialized = true

    OnCreatureEliminated(Res:device_ai_interaction_result):void =
        if(Agent := CurrentAgent?):
            set CurrentGold = CurrentGold + GoldPerKill
            CurrentGranter.GrantItem(Agent)
            ShowGold()

    ShowGold<private>():void =
        HudManager.ShowGold(CurrentGold)

    OnMonsterEmerged(IsLassBoss: logic):void =
        HudManager.ShowMonsterEmergedMessage()
        if (IsLassBoss = true):
            BgmManager.PlayLassBossBgm()
        else:
            BgmManager.PlayBattleBgm()

    OnMonsterDefeated(IsLassBoss: logic):void =
        HudManager.ShowMonsterDefeatedMessage()
        BgmManager.OnMonsterDefeated()
        AccoladeAgent(IsLassBoss)
    
    AccoladeAgent(IsLassBoss: logic):void =
        if(Agent := CurrentAgent?):
            if (IsLassBoss = true):
                AccoladeLasBoss.Award(Agent)
            else:
                AccoladeBoss.Award(Agent)
        
