
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

attack_effect := struct:
    Prop : creative_prop
    Explosive : explosive_device
    DistanceFromPlayer : float
    DistanceFromGround: float
    BehindFromPlayer : float
    AboveFromPlayer: float
    AngleBehindPlayer: float
    AttackDuration : float


# A Verse-authored creative device that can be placed in a level
increase_attack_magic_device := class(increase_ability_device):

    @editable PropLevel1:creative_prop = creative_prop{}
    @editable PropLevel2:creative_prop = creative_prop{}
    @editable PropLevel3:creative_prop = creative_prop{}
    @editable ExplisiveLevel1 : explosive_device = explosive_device{}
    @editable ExplisiveLevel2 : explosive_device = explosive_device{}
    @editable ExplisiveLevel3 : explosive_device = explosive_device{}
    @editable MeteorMagic: meteor_magic_device = meteor_magic_device{}
    @editable Barrier: barrier_device = barrier_device{}
    @editable Billboard: billboard_device = billboard_device{}
    @editable HudManager: hud_manager_device = hud_manager_device{}

    MAX_ITEM_REQUIRED_COUNT: int = 1000000

    AttackEffectList(): []attack_effect = array{
        attack_effect {Prop := PropLevel1, Explosive := ExplisiveLevel1, DistanceFromPlayer:= 3000.0, DistanceFromGround:= 200.0, BehindFromPlayer:= 1000.0, AboveFromPlayer:= 500.0, AngleBehindPlayer:= 20.0, AttackDuration:= 0.8},
        attack_effect {Prop := PropLevel2, Explosive := ExplisiveLevel2, DistanceFromPlayer:= 4000.0, DistanceFromGround:= 1000.0, BehindFromPlayer:= 5000.0, AboveFromPlayer:= 3000.0, AngleBehindPlayer:= 45.0, AttackDuration:= 1.0},
        attack_effect {Prop := PropLevel3, Explosive := ExplisiveLevel3, DistanceFromPlayer:= 6000.0, DistanceFromGround:= 500.0, BehindFromPlayer:= 4000.0, AboveFromPlayer:= 3000.0, AngleBehindPlayer:= 60.0, AttackDuration:= 1.3}
    }

    GetNewRequiredCount<override>(IncreasedCount: int):int =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..IncreasedCount - 1 ):
            set NewCount = NewCount * 10
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        return NewCount

    UpdateAbility<override>(Agent: agent,  IncreasedCount: int):void =
        Print("increase_attack_magic UpdateAbility count={IncreasedCount}")
        Barrier.Disable()
        List := AttackEffectList()
        if (Effect := List[IncreasedCount - 1]):
            MeteorMagic.SetCurrentAttackEffect(Effect)
        BillboardMessage := "Attack magic level up"
        Billboard.SetText(StringToMessage(BillboardMessage))
        HudManager.ShowAttackMagicMessage(Agent)
    
    StringToMessage<localizes>(value:string) : message = "{value}"
    

        
