
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

member := struct:
    Spawner : guard_spawner_device
    Scene : scene

# A Verse-authored creative device that can be placed in a level
increase_party_member_device := class(increase_ability_device):

    @editable JaegerSpawner: guard_spawner_device = guard_spawner_device{}
    @editable FennixSpawner: guard_spawner_device = guard_spawner_device{}
    @editable FrontierSpawner: guard_spawner_device = guard_spawner_device{}
    @editable PennySpawner: guard_spawner_device = guard_spawner_device{}
    @editable RebelSpawner: guard_spawner_device = guard_spawner_device{}
    @editable SeaWolfSpawner: guard_spawner_device = guard_spawner_device{}
    @editable LinesManager: lines_manager = lines_manager{}

    MAX_ITEM_REQUIRED_COUNT: int = 1000000

    MemberList(): []member = array{
        member{Spawner := JaegerSpawner, Scene := scene.Jaeger},
        member{Spawner := PennySpawner, Scene := scene.Penny},
        member{Spawner := FrontierSpawner, Scene := scene.Frontier},
        member{Spawner := FennixSpawner, Scene := scene.Fennix},
        member{Spawner := RebelSpawner, Scene := scene.Rebel},
        member{Spawner := SeaWolfSpawner, Scene := scene.SeaWolf}
    }

    GetNewRequiredCount<override>(IncreasedCount: int):int =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..IncreasedCount - 1 ):
            set NewCount = NewCount * 5
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        return NewCount

    UpdateAbility<override>(Agent: agent,  IncreasedCount: int):void =
        if (IncreasedCount = 0):
            return
        Members := MemberList()
        for(Index : int = 0..IncreasedCount - 1 ):
            if(Member := Members[Index]):
                Spawner := Member.Spawner
                Spawner.Enable()

        ShouldShow := ShouldShowIntroduction(Agent, IncreasedCount)
        if (ShouldShow = true):
            if (Member := Members[IncreasedCount - 1]):
                LinesManager.StartScene(Agent, Member.Scene)

    ShouldShowIntroduction(Agent: agent, IncreasedCount: int): logic =
        ItemCount := ItemCountProvider.GetItemCount(Agent, 0)
        if (ItemCount = IncreasedCount): #ゲーム開始直後やプレイヤーがRespawnしたケース
            return false
        else: #ボタンを押して新しい仲間を追加したケース
            return true


