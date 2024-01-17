
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
crystal_granter_device := class(creative_device):

    @editable GuardSpawner: guard_spawner_device = guard_spawner_device{}
    @editable MutatorZone: mutator_zone_device = mutator_zone_device{}
    @editable BossNumber: int = 1
    @editable ItemSpawner: item_spawner_device = item_spawner_device{}
    @editable Beacon: beacon_device = beacon_device{}

    var EliminatedCount:int = 0
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        MutatorZone.AgentEntersEvent.Subscribe(OnPlayerEntered)
        GuardSpawner.EliminatedEvent.Subscribe(OnBossEliminated)

    OnPlayerEntered(Agent: agent):void =
        for(Index : int = 0..BossNumber - 1 ):
            GuardSpawner.Spawn()

    OnBossEliminated(Res:device_ai_interaction_result):void =
        set EliminatedCount += 1
        if (EliminatedCount = BossNumber):
            ItemSpawner.SpawnItem()
            Beacon.Enable()



