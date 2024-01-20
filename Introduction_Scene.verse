
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
Introduction_Scene := class(creative_device):

    @editable LinesManager: lines_manager = lines_manager{}
    @editable ItemCountProvider: conditional_button_device = conditional_button_device{}
    @editable ItemGranter: item_granter_device = item_granter_device{}
    @editable IntroductionTrigger : mutator_zone_device = mutator_zone_device{}
    @editable InitialCreatureSpawner: creature_spawner_device = creature_spawner_device{}
    @editable SecondCreatureSpawner: creature_spawner_device = creature_spawner_device{}

    var MaxCreatuesCount:int = 20
    var CurrentEliminatedCount:int = 0
    var CurrentAgent: ?agent = false

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        IntroductionTrigger.AgentExitsEvent.Subscribe(OnIntroductionInNeed)
        InitialCreatureSpawner.EliminatedEvent.Subscribe(OnCreatureEliminated)

    OnIntroductionInNeed(Agent: agent):void =
        ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
        if (ItemCount > 0):
            return #Already Introduced
        ItemGranter.GrantItem(Agent)
        set CurrentAgent = option{Agent}
        spawn{StartIntroduction(Agent)}

    StartIntroduction<private>(Agent: agent)<suspends>: void =
        LinesManager.OnIntroduction1(Agent)
        Sleep(LinesManager.GetSceneDuration(Agent, scene.Introduction1))
        InitialCreatureSpawner.Enable()
        Print("OnIntro2")
        Sleep(2.0)
        LinesManager.OnIntroduction2(Agent)

    OnCreatureEliminated(Res:device_ai_interaction_result):void =
        set CurrentEliminatedCount += 1
        if (CurrentEliminatedCount = MaxCreatuesCount):
            spawn{StartGame()}

    StartGame<private>()<suspends>:void =
        if (Agent := CurrentAgent?):
            LinesManager.OnIntroduction3(Agent)
            Sleep(5.0)
            SecondCreatureSpawner.Enable()



