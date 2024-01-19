
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
vfx_follow_player_device := class(creative_device):

    @editable var Prop : creative_prop = creative_prop{}
    @editable GoldButton: conditional_button_device = conditional_button_device{}
    @editable SaveButton: conditional_button_device = conditional_button_device{}
    @editable HpButton: conditional_button_device = conditional_button_device{}
    @editable ShieldButton: conditional_button_device = conditional_button_device{}
    @editable AttackButton: conditional_button_device = conditional_button_device{}
    @editable MagicAttackButton: conditional_button_device = conditional_button_device{}
    @editable MagicHealButton: conditional_button_device = conditional_button_device{}
    @editable GoldVfx: vfx_spawner_device = vfx_spawner_device{}
    @editable SaveVfx: vfx_spawner_device = vfx_spawner_device{}
    @editable HpVfx: vfx_spawner_device = vfx_spawner_device{}
    @editable ShieldVfx: vfx_spawner_device = vfx_spawner_device{}
    @editable AttackVfx: vfx_spawner_device = vfx_spawner_device{}
    @editable MagicAttackVfx: vfx_spawner_device = vfx_spawner_device{}
    @editable MagicHealVfx: vfx_spawner_device = vfx_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        GoldButton.ActivatedEvent.Subscribe(OnGold)
        SaveButton.ActivatedEvent.Subscribe(OnSave)
        HpButton.ActivatedEvent.Subscribe(OnHp)
        ShieldButton.ActivatedEvent.Subscribe(OnShield)
        AttackButton.ActivatedEvent.Subscribe(OnAttck)
        MagicAttackButton.ActivatedEvent.Subscribe(OnMagicAttack)
        MagicHealButton.ActivatedEvent.Subscribe(OnMagicHeal)

    OnGold(Agent: agent):void =
        spawn{StartVfx(Agent, GoldVfx)}
    OnSave(Agent: agent):void =
        spawn{StartVfx(Agent, SaveVfx)}
    OnHp(Agent: agent):void =
        spawn{StartVfx(Agent, HpVfx)}
    OnShield(Agent: agent):void =
        spawn{StartVfx(Agent, ShieldVfx)}
    OnAttck(Agent: agent):void =
        spawn{StartVfx(Agent, AttackVfx)}
    OnMagicAttack(Agent: agent):void =
        spawn{StartVfx(Agent, MagicAttackVfx)}    
    OnMagicHeal(Agent: agent):void =
        spawn{StartVfx(Agent, MagicHealVfx)}


    StartVfx<private>(Agent: agent, Vfx: vfx_spawner_device)<suspends>:void =
        SetProp(Agent)
        Vfx.Enable()
        FollowPlayer(Agent)
        Vfx.Disable()


    SetProp<private>(Agent: agent)<suspends>:void =
        if (FortChar := Agent.GetFortCharacter[]):
            CharLocation := FortChar.GetTransform().Translation
            CharRotation := FortChar.GetTransform().Rotation
            NewLocation := vector3{X := CharLocation.X, Y := CharLocation.Y, Z := CharLocation.Z + 50.0}
            if (Prop.TeleportTo[NewLocation, CharRotation]):
                Print("SetProp")

    FollowPlayer(Agent : agent)<suspends>:void=
        for(Index : int = 0..50 ):
            if (FortChar := Agent.GetFortCharacter[]):
                CharLocation := FortChar.GetTransform().Translation
                CharRotation := FortChar.GetTransform().Rotation
                NewLocation := vector3{X := CharLocation.X, Y := CharLocation.Y, Z := CharLocation.Z + 50.0}
                Prop.MoveTo(NewLocation, CharRotation, 0.1)
