
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.


gold_per_kill := struct:
    GoldGranter : item_granter_device
    GoldPerKillCount : int

# A Verse-authored creative device that can be placed in a level
increase_gold_device := class(increase_ability_device):

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

    @editable GameManager: game_manager_device = game_manager_device{}
    @editable Billboard: billboard_device = billboard_device{}

    MAX_ITEM_REQUIRED_COUNT: int = 1000000

    GoldPerKillList(): []gold_per_kill = array{
        gold_per_kill {GoldGranter := GoldGranter, GoldPerKillCount := 1},
        gold_per_kill {GoldGranter := GoldGranter2, GoldPerKillCount := 2},
        gold_per_kill {GoldGranter := GoldGranter5, GoldPerKillCount := 5},
        gold_per_kill {GoldGranter := GoldGranter10, GoldPerKillCount := 10},
        gold_per_kill {GoldGranter := GoldGranter20, GoldPerKillCount := 20},
        gold_per_kill {GoldGranter := GoldGranter50, GoldPerKillCount := 50},
        gold_per_kill {GoldGranter := GoldGranter100, GoldPerKillCount := 100},
        gold_per_kill {GoldGranter := GoldGranter200, GoldPerKillCount := 200},
        gold_per_kill {GoldGranter := GoldGranter500, GoldPerKillCount := 500},
        gold_per_kill {GoldGranter := GoldGranter1000, GoldPerKillCount := 1000}
    }

    GetNewRequiredCount<override>(IncreasedCount: int):int =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..IncreasedCount - 1 ):
            set NewCount = NewCount * 2
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        return NewCount

    UpdateAbility<override>(FortChar: fort_character,  IncreasedCount: int):void =
        GoldPerKills := GoldPerKillList()
        if (GoldPerKill := GoldPerKills[IncreasedCount]):
            GameManager.SetGoldGranter(GoldPerKill.GoldGranter)
            GameManager.UpdateGoldPerKill(GoldPerKill.GoldPerKillCount)
        if (GoldPerKill := GoldPerKills[IncreasedCount + 1]):
            BillboardMessage := "{GoldPerKill.GoldPerKillCount} Golds / Kill"
            Billboard.SetText(StringToMessage(BillboardMessage))
            Billboard.ShowText()

    StringToMessage<localizes>(value:string) : message = "{value}"

