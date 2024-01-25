
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
hud_manager_device := class(creative_device):

    @editable GoldMessage: hud_message_device = hud_message_device{}
    @editable GoldPerKillMessage: hud_message_device = hud_message_device{}
    @editable MainUIA0H0: hud_message_device = hud_message_device{}
    @editable MainUIA0H1: hud_message_device = hud_message_device{}
    @editable MainUIA0H2: hud_message_device = hud_message_device{}
    @editable MainUIA0H3: hud_message_device = hud_message_device{}
    @editable MainUIA1H0: hud_message_device = hud_message_device{}
    @editable MainUIA1H1: hud_message_device = hud_message_device{}
    @editable MainUIA1H2: hud_message_device = hud_message_device{}
    @editable MainUIA1H3: hud_message_device = hud_message_device{}
    @editable MainUIA2H0: hud_message_device = hud_message_device{}
    @editable MainUIA2H1: hud_message_device = hud_message_device{}
    @editable MainUIA2H2: hud_message_device = hud_message_device{}
    @editable MainUIA2H3: hud_message_device = hud_message_device{}
    @editable MainUIA3H0: hud_message_device = hud_message_device{}
    @editable MainUIA3H1: hud_message_device = hud_message_device{}
    @editable MainUIA3H2: hud_message_device = hud_message_device{}
    @editable MainUIA3H3: hud_message_device = hud_message_device{}
    @editable AttacPowerImage: hud_message_device = hud_message_device{}
    @editable AttacPowerValue: hud_message_device = hud_message_device{}

    var CurrentAttackMagicLevel<private> :int = 0
    var CurrentHealingMagicLevel<private> :int = 0
    var CurrentAttackPower<private>:int = 1
    var IsMainUiInitialized:logic = false
    var IsAttackPowerUiInitialized:logic = false

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        AttacPowerImage.Show()
        if (IsAttackPowerUiInitialized = false):
            ShowAttackPowerUI()
        if (IsMainUiInitialized = false):
            ShowMainUI()

    ShowGold(GoldCount: int):void =
        GoldMessage.Hide()
        GoldMessage.SetText(StringToMessage("{GoldCount}"))
        GoldMessage.Show()

    ShowGoldPerKill(GoldPerKill: int):void =
        GoldPerKillMessage.Hide()
        GoldPerKillMessage.SetText(StringToMessage("{GoldPerKill}"))
        GoldPerKillMessage.Show()

    StringToMessage<localizes>(value:string) : message = "{value}"

    UpdateAttackMagicLevel(Level: int):void =
        set CurrentAttackMagicLevel = Level
        ShowMainUI()

    UpdateHealingMagicLevel(Level: int):void =
        set CurrentHealingMagicLevel = Level
        ShowMainUI()

    UpdateAttackPower(Value: int):void =
        set CurrentAttackPower = Value
        ShowAttackPowerUI()

    ShowAttackPowerUI():void =
        set IsAttackPowerUiInitialized = true
        AttacPowerValue.Hide()
        AttacPowerValue.SetText(StringToMessage("Attack power × {CurrentAttackPower}"))

    HideMainUI<private>():void =
        MainUIA0H0.Hide()
        MainUIA0H1.Hide()
        MainUIA0H2.Hide()
        MainUIA0H3.Hide()
        MainUIA1H0.Hide()
        MainUIA1H1.Hide()
        MainUIA1H2.Hide()
        MainUIA1H3.Hide()
        MainUIA2H0.Hide()
        MainUIA2H1.Hide()
        MainUIA2H2.Hide()
        MainUIA2H3.Hide()
        MainUIA3H0.Hide()
        MainUIA3H1.Hide()
        MainUIA3H2.Hide()
        MainUIA3H3.Hide()
    
    ShowMainUI<private>():void =
        HideMainUI()
        set IsMainUiInitialized = true
        Print("MainUI Attack={CurrentAttackMagicLevel} Healing={CurrentHealingMagicLevel}")
        if (     CurrentAttackMagicLevel =0 and CurrentHealingMagicLevel  = 1):
            MainUIA0H1.Show()
        else if (CurrentAttackMagicLevel =0 and CurrentHealingMagicLevel  = 2):
            MainUIA0H2.Show()
        else if (CurrentAttackMagicLevel =0 and CurrentHealingMagicLevel  = 3):
            MainUIA0H3.Show()
        else if (CurrentAttackMagicLevel =1 and CurrentHealingMagicLevel  = 0):
            MainUIA1H0.Show()
        else if (CurrentAttackMagicLevel =1 and CurrentHealingMagicLevel  = 1):
            MainUIA1H1.Show()
        else if (CurrentAttackMagicLevel =1 and CurrentHealingMagicLevel  = 2):
            MainUIA1H2.Show()
        else if (CurrentAttackMagicLevel =1 and CurrentHealingMagicLevel  = 3):
            MainUIA1H3.Show()
        else if (CurrentAttackMagicLevel =2 and CurrentHealingMagicLevel  = 0):
            MainUIA2H0.Show()
        else if (CurrentAttackMagicLevel =2 and CurrentHealingMagicLevel  = 1):
            MainUIA2H1.Show()
        else if (CurrentAttackMagicLevel =2 and CurrentHealingMagicLevel  = 2):
            MainUIA2H2.Show()
        else if (CurrentAttackMagicLevel =2 and CurrentHealingMagicLevel  = 3):
            MainUIA2H3.Show()
        else if (CurrentAttackMagicLevel =3 and CurrentHealingMagicLevel  = 0):
            MainUIA3H0.Show()
        else if (CurrentAttackMagicLevel =3 and CurrentHealingMagicLevel  = 1):
            MainUIA3H1.Show()
        else if (CurrentAttackMagicLevel =3 and CurrentHealingMagicLevel  = 2):
            MainUIA3H2.Show()
        else if (CurrentAttackMagicLevel =3 and CurrentHealingMagicLevel  = 3):
            MainUIA3H3.Show()
        else:
            MainUIA0H0.Show()
