
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
hud_manager_device := class(creative_device):

    @editable GoldMessage: hud_message_device = hud_message_device{}
    @editable GoldPerKillMessage: hud_message_device = hud_message_device{}
    @editable MainMessage: hud_message_device = hud_message_device{}
    @editable VendingMachine1: vending_machine_device = vending_machine_device{}
    @editable AttackMagicMessage: hud_message_device = hud_message_device{}
    @editable HealMagicMessage: hud_message_device = hud_message_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        VendingMachine1.ItemSpawnedEvent.Subscribe(OnPurchased1)
        ShowWelcomeMessage()

    ShowAttackMagicMessage(Agent: agent):void =
        AttackMagicMessage.Show()

    ShowHealMagicMessage(Agent: agent):void =
        HealMagicMessage.Show()

    ShowWelcomeMessage()<suspends>:void =
        ShowMainMessage("Welcome!")
        Sleep(3.0)
        ShowMainMessage("Buy weapon with Gold!")


    OnPurchased1(Agent: agent):void =
        ShowMainMessage("Shoot monsters to earn Golds!!")
    
    ShowGold(GoldCount: int):void =
        GoldMessage.Hide()
        GoldMessage.SetText(StringToMessage("{GoldCount}"))
        GoldMessage.Show()

    ShowGoldPerKill(GoldPerKill: int):void =
        GoldPerKillMessage.Hide()
        GoldPerKillMessage.SetText(StringToMessage("{GoldPerKill}"))
        GoldPerKillMessage.Show()

    ShowMainMessage(Message: string) : void =
        MainMessage.Hide()
        MainMessage.Show(StringToMessage(Message))

    StringToMessage<localizes>(value:string) : message = "{value}"

    ShowMonsterEmergedMessage():void =
        spawn{MonsterEmergedMessage()}

    MonsterEmergedMessage<private>()<suspends>:void =
        ShowMainMessage("Giant monster has appeared!")
        Sleep(4.0)
        ShowMainMessage("Build a mega turret gun and defeat it!")

    ShowMonsterDefeatedMessage():void =
        ShowMainMessage("You made it!!")
        