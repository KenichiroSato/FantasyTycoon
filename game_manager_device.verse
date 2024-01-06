
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Random }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
game_manager_device := class(creative_device):

    @editable CreatureSpawners: []creature_spawner_device = array{}

    @editable GoldGranter: item_granter_device = item_granter_device{}
    @editable GoldGranter2: item_granter_device = item_granter_device{}
    @editable GoldGranter5: item_granter_device = item_granter_device{}
    @editable GoldGranter10: item_granter_device = item_granter_device{}
    @editable GoldGranter20: item_granter_device = item_granter_device{}
    @editable GoldGranter50: item_granter_device = item_granter_device{}
    @editable GoldGranter100: item_granter_device = item_granter_device{}
    @editable GoldGranter200: item_granter_device = item_granter_device{}
    @editable GoldGranter500: item_granter_device = item_granter_device{}
    @editable GoldGranter1000: item_granter_device = item_granter_device{}
    
    @editable SpawnDevice:player_spawner_device = player_spawner_device{}
    @editable HudManager:hud_manager_device = hud_manager_device{}
    @editable VendingMachines1: vending_machine_device = vending_machine_device{}
    @editable VendingMachines10: []vending_machine_device = array{}
    @editable VendingMachines100: []vending_machine_device = array{}
    @editable InitialItemSpawner: item_spawner_device = item_spawner_device{}

    @editable ButtonPerKill_2: conditional_button_device = conditional_button_device{}
    @editable ButtonPerKill_5: conditional_button_device = conditional_button_device{}
    @editable ButtonPerKill_10: conditional_button_device = conditional_button_device{}
    @editable ButtonPerKill_20: conditional_button_device = conditional_button_device{}
    @editable ButtonPerKill_50: conditional_button_device = conditional_button_device{}
    @editable ButtonPerKill_100: conditional_button_device = conditional_button_device{}
    @editable ButtonPerKill_200: conditional_button_device = conditional_button_device{}
    @editable ButtonPerKill_500: conditional_button_device = conditional_button_device{}
    @editable ButtonPerKill_1000: conditional_button_device = conditional_button_device{}

    @editable BgmManager: bgm_manager = bgm_manager{}
    @editable AccoladeBoss: accolades_device = accolades_device{}
    @editable AccoladeLasBoss: accolades_device = accolades_device{}
    
    var CurrentAgent: ?agent = false
    var GoldPerKill:int = 1
    var CurrentGold:int = 0
    var CurrentGranter: item_granter_device = item_granter_device{}

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
        ButtonPerKill_2.ActivatedEvent.Subscribe(OnActivatedPerKill_2)
        ButtonPerKill_5.ActivatedEvent.Subscribe(OnActivatedPerKill_5)
        ButtonPerKill_10.ActivatedEvent.Subscribe(OnActivatedPerKill_10)
        ButtonPerKill_20.ActivatedEvent.Subscribe(OnActivatedPerKill_20)
        ButtonPerKill_50.ActivatedEvent.Subscribe(OnActivatedPerKill_50)
        ButtonPerKill_100.ActivatedEvent.Subscribe(OnActivatedPerKill_100)
        ButtonPerKill_200.ActivatedEvent.Subscribe(OnActivatedPerKill_200)
        ButtonPerKill_500.ActivatedEvent.Subscribe(OnActivatedPerKill_500)
        ButtonPerKill_1000.ActivatedEvent.Subscribe(OnActivatedPerKill_1000)
        InitialItemSpawner.ItemPickedUpEvent.Subscribe(OnInitialGoldPickedUp)
        set CurrentGranter = GoldGranter
        HudManager.ShowGold(CurrentGold)
        HudManager.ShowGoldPerKill(GoldPerKill)
        
    OnInitialGoldPickedUp(Agent: agent):void =
        set CurrentGold = CurrentGold + 1
        ShowGold()
        
    OnActivatedPerKill_2(Agent: agent):void =
        UpdateGoldPerKill(2)
        set CurrentGranter = GoldGranter2
    OnActivatedPerKill_5(Agent: agent):void =
        UpdateGoldPerKill(5)
        set CurrentGranter = GoldGranter5
    OnActivatedPerKill_10(Agent: agent):void =
        UpdateGoldPerKill(10)
        set CurrentGranter = GoldGranter10
    OnActivatedPerKill_20(Agent: agent):void =
        UpdateGoldPerKill(20)
        set CurrentGranter = GoldGranter20
    OnActivatedPerKill_50(Agent: agent):void =
        UpdateGoldPerKill(50)
        set CurrentGranter = GoldGranter50
    OnActivatedPerKill_100(Agent: agent):void =
        UpdateGoldPerKill(100)
        set CurrentGranter = GoldGranter100
    OnActivatedPerKill_200(Agent: agent):void =
        UpdateGoldPerKill(200)
        set CurrentGranter = GoldGranter200
    OnActivatedPerKill_500(Agent: agent):void =
        UpdateGoldPerKill(500)
        set CurrentGranter = GoldGranter500
    OnActivatedPerKill_1000(Agent: agent):void =
        UpdateGoldPerKill(1000)
        set CurrentGranter = GoldGranter1000

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
        
