
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
increase_party_member_device := class(increase_ability_device):

    @editable GuardSpawner1: guard_spawner_device = guard_spawner_device{}
    @editable GuardSpawner2: guard_spawner_device = guard_spawner_device{}
    @editable GuardSpawner3: guard_spawner_device = guard_spawner_device{}
    @editable GuardSpawner4: guard_spawner_device = guard_spawner_device{}
    @editable GuardSpawner5: guard_spawner_device = guard_spawner_device{}
    @editable GuardSpawner6: guard_spawner_device = guard_spawner_device{}
    @editable GuardSpawner7: guard_spawner_device = guard_spawner_device{}

    MAX_ITEM_REQUIRED_COUNT: int = 1000000

    MemberList(): []guard_spawner_device = array{
        GuardSpawner1,
        GuardSpawner2,
        GuardSpawner3,
        GuardSpawner4,
        GuardSpawner5,
        GuardSpawner6,
        GuardSpawner7
    }

    GetNewRequiredCount<override>(IncreasedCount: int):int =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..IncreasedCount - 1 ):
            set NewCount = NewCount * 2
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        return NewCount

    UpdateAbility<override>(FortChar: fort_character,  IncreasedCount: int):void =
        if (IncreasedCount = 0):
            return
        Members := MemberList()
        for(Index : int = 0..IncreasedCount - 1 ):
            if(GuardSpawner := Members[Index]):
                GuardSpawner.Enable()