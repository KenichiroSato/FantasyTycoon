
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
    @editable Beacon: beacon_device = beacon_device{}


    var IsPlayerInTheArea:logic = false
    var EliminatedCount:int = 0
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        MutatorZone.AgentEntersEvent.Subscribe(OnPlayerEntered)
        MutatorZone.AgentExitsEvent.Subscribe(OnPlayerExit)
        BossSpawner.EliminatedEvent.Subscribe(OnBossEliminated)
        GuardSpawner.EliminatedEvent.Subscribe(OnBossEliminated)

    OnPlayerEntered(Agent: agent):void =
        set IsPlayerInTheArea = true
        set EliminatedCount = 0
        for(Index : int = 0..BossNumber - 1 ):
            Print("Boss Spawn")
            BossSpawner.Spawn()
        for(Index : int = 0..GuardNumber - 1 ):
            Print("Guard Spawn")
            GuardSpawner.Spawn()

    OnPlayerExit(Agent: agent):void =
        set IsPlayerInTheArea = false
        Print("OnPlayerExit")
        spawn{DespawnAfterSleep()}

    DespawnAfterSleep<private>()<suspends>:void =
        Sleep(5.0)
        Print("Boss Despawn")
        BossSpawner.Despawn()
        GuardSpawner.Despawn()
        set EliminatedCount = 0

    OnBossEliminated(Res:device_ai_interaction_result):void =
        if(IsPlayerInTheArea = true): 
            Print("OnBossEliminated")
            set EliminatedCount += 1
            if (EliminatedCount = BossNumber + GuardNumber):
                ItemSpawner.SpawnItem()
                Beacon.Enable()



