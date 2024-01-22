
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
crystal_granter_device := class(creative_device):

    @editable BossSpawner: guard_spawner_device = guard_spawner_device{}
    @editable GuardSpawner: guard_spawner_device = guard_spawner_device{}
    @editable MutatorZone: mutator_zone_device = mutator_zone_device{}
    @editable BossNumber: int = 1
    @editable GuardNumber: int = 0
    @editable ItemSpawner: item_spawner_device = item_spawner_device{}
    @editable Indicator: map_indicator_device = map_indicator_device{}
    @editable BgmManager: bgm_manager = bgm_manager{}


    var EliminatedCount:int = 0
    var CurrentAgent: ?agent = false
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        MutatorZone.AgentEntersEvent.Subscribe(OnPlayerEntered)
        MutatorZone.AgentExitsEvent.Subscribe(OnPlayerExit)
        BossSpawner.EliminatedEvent.Subscribe(OnBossEliminated)
        GuardSpawner.EliminatedEvent.Subscribe(OnBossEliminated)

    OnPlayerEntered(Agent: agent):void =
        set CurrentAgent = option{Agent}
        set EliminatedCount = 0
        for(Index : int = 0..BossNumber - 1 ):
            Print("Boss Spawn")
            BossSpawner.Spawn()
        for(Index : int = 0..GuardNumber - 1 ):
            Print("Guard Spawn")
            GuardSpawner.Spawn()
        BgmManager.PlayBattleBgm()

    OnPlayerExit(Agent: agent):void =
        set CurrentAgent = false
        Print("OnPlayerExit")
        spawn{DespawnAfterSleep()}
        BgmManager.PlayNormalBgm()

    DespawnAfterSleep<private>()<suspends>:void =
        Sleep(5.0)
        Print("Boss Despawn")
        BossSpawner.Despawn()
        GuardSpawner.Despawn()
        set EliminatedCount = 0

    OnBossEliminated(Res:device_ai_interaction_result):void =
        if(Agent := CurrentAgent?): 
            Print("OnBossEliminated")
            set EliminatedCount += 1
            if (EliminatedCount = BossNumber + GuardNumber):
                ItemSpawner.SpawnItem()
                Indicator.Enable()
                Indicator.ActivateObjectivePulse(Agent)
                spawn{BgmManager.PlayMonsterDefeated()}




