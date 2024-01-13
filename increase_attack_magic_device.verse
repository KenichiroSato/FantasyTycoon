
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

attack_effect := struct:
    Prop : creative_prop
    Explosive : explosive_device

# A Verse-authored creative device that can be placed in a level
increase_attack_magic_device := class(increase_ability_device):

    @editable PropLevel1:creative_prop = creative_prop{}
    @editable PropLevel2:creative_prop = creative_prop{}
    @editable PropLevel3:creative_prop = creative_prop{}
    @editable ExplisiveLevel1 : explosive_device = explosive_device{}
    @editable ExplisiveLevel2 : explosive_device = explosive_device{}
    @editable ExplisiveLevel3 : explosive_device = explosive_device{}
    @editable MeteorMagic: meteor_magic_device = meteor_magic_device{}
    MAX_ITEM_REQUIRED_COUNT: int = 1000000

    AttackEffectList(): []attack_effect = array{
        attack_effect {Prop := PropLevel1, Explosive := ExplisiveLevel1},
        attack_effect {Prop := PropLevel2, Explosive := ExplisiveLevel2},
        attack_effect {Prop := PropLevel3, Explosive := ExplisiveLevel3}
    }

    GetNewRequiredCount<override>(IncreasedCount: int):int =
        var NewCount:int = BaseItemRequiredCount
        for(Index : int = 0..IncreasedCount - 1 ):
            set NewCount = NewCount * 10
        if (NewCount > MAX_ITEM_REQUIRED_COUNT):
            set NewCount = MAX_ITEM_REQUIRED_COUNT
        return NewCount

    UpdateAbility<override>(FortChar: fort_character,  IncreasedCount: int):void =
        List := AttackEffectList()
        if (Effect := List[IncreasedCount]):
            MeteorMagic.SetCurrentAttackEffect(Effect)


        
