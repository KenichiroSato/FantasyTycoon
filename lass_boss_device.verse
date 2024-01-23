
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
lass_boss_device := class(creative_device):

    @editable BossSpawner: guard_spawner_device = guard_spawner_device{}
    @editable GuardSpawner: guard_spawner_device = guard_spawner_device{}
    @editable MutatorZone: mutator_zone_device = mutator_zone_device{}
    @editable BossNumber: int = 1
    @editable GuardNumber: int = 3
    @editable Gate: creative_prop = creative_prop{}
    @editable Indicator: map_indicator_device = map_indicator_device{}
    @editable BgmManager: bgm_manager = bgm_manager{}
    @editable Accolade: accolades_device = accolades_device{}

    var GateInitialPosition<private>: vector3 = vector3{X:=0.0, Y:= 0.0, Z:=0.0}

    var EliminatedCount:int = 0
    var CurrentAgent: ?agent = false
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        MutatorZone.AgentEntersEvent.Subscribe(OnPlayerEntered)
        MutatorZone.AgentExitsEvent.Subscribe(OnPlayerExit)
        BossSpawner.EliminatedEvent.Subscribe(OnBossEliminated)
        GuardSpawner.EliminatedEvent.Subscribe(OnBossEliminated)
        set GateInitialPosition = Gate.GetTransform().Translation

    OnPlayerEntered(Agent: agent):void =
        set CurrentAgent = option{Agent}
        set EliminatedCount = 0
        for(Index : int = 0..BossNumber - 1 ):
            Print("Boss Spawn")
            BossSpawner.Spawn()
        for(Index : int = 0..GuardNumber - 1 ):
            Print("Guard Spawn")
            GuardSpawner.Spawn()
        BgmManager.PlayLassBossBgm()
        SetGateInitialPosition()

    OnPlayerExit(Agent: agent):void =
        set CurrentAgent = false
        Print("OnPlayerExit")
        spawn{DespawnAfterSleep()}
        BgmManager.PlayNormalBgm()
        Indicator.DeactivateObjectivePulse(Agent)

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
                spawn{ShowGate()}
                Indicator.Enable()
                Indicator.ActivateObjectivePulse(Agent)
                spawn{BgmManager.PlayMonsterDefeated()}
                Accolade.Award(Agent)

    ShowGate<private>()<suspends>:void =
        NewLocation := vector3{X := GateInitialPosition.X, Y := GateInitialPosition.Y, Z := GateInitialPosition.Z + 1000.0}
        Gate.MoveTo(NewLocation, Gate.GetTransform().Rotation, 1.0)

    SetGateInitialPosition<private>():void =
        if (Gate.TeleportTo[GateInitialPosition, Gate.GetTransform().Rotation]):
            Print("Hide")

