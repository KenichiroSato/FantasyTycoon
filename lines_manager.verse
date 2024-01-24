
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Assets }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /UnrealEngine.com/Temporary/UI }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.


duration := enum{Short, Medium, Long}

scene:= enum{ 
    Introduction1,
    Introduction2,
    Introduction3,
    FirstBoss,
    FirstCrystal,
    SavePoint,
    LastCrystal,
    Portal,
    DefeatLassBoss,
    Jaeger,
    Fennix,
    Frontier,
    Penny,
    Rebel,
    SeaWolf
    }

line := struct:
    Character : texture
    Sentence : texture
    Duration : duration

# A Verse-authored creative device that can be placed in a level
lines_manager := class(creative_device):

    @editable FirstCrystalTrigger : item_spawner_device = item_spawner_device{}
    @editable LastCrystalTrigger : item_spawner_device = item_spawner_device{}
    @editable FirstBossTrigger : mutator_zone_device = mutator_zone_device{}
    @editable SavePointTrigger: conditional_button_device = conditional_button_device{}
    @editable PortalTrigger: conditional_button_device = conditional_button_device{}
    @editable DefeatLassBossTrigger : guard_spawner_device = guard_spawner_device{}
    @editable LanguageManager: language_manager = language_manager{}

    var MaybeMyUIPerPlayer : [player]?canvas = map{}

    var IsStarted: logic = false
    var LinesProvider: lines_provider = english_lines_provider{}
    var IsProviderSet: logic = false

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        FirstCrystalTrigger.ItemPickedUpEvent.Subscribe(OnFirstCrystal)
        LastCrystalTrigger.ItemPickedUpEvent.Subscribe(OnLastCrystal)
        FirstBossTrigger.AgentEntersEvent.Subscribe(OnFisrstBoss)
        SavePointTrigger.ActivatedEvent.Subscribe(OnSavePoint)
        PortalTrigger.ActivatedEvent.Subscribe(OnPortal)

    SetLinesProviderIfNeed(Agent: agent):void =
        if (IsProviderSet = true):
            return
        Lang := LanguageManager.GetCurrentLang(Agent)
        case(Lang):
            language.Japanese => set LinesProvider = japanese_lines_provider{}
            language.Spanish  => set LinesProvider = spanish_lines_provider{}
            language.French  => set LinesProvider = french_lines_provider{}
                            _ => set LinesProvider = english_lines_provider{}
        set IsProviderSet = true

    OnIntroduction1(Agent: agent):void =
        StartScene(Agent, scene.Introduction1)

    OnIntroduction2(Agent: agent):void =
        StartScene(Agent, scene.Introduction2)

    OnIntroduction3(Agent: agent):void =
        StartScene(Agent, scene.Introduction3)

    OnFirstCrystal(Agent: agent):void =
        StartScene(Agent, scene.FirstCrystal)

    OnFisrstBoss(Agent: agent):void =
        StartScene(Agent, scene.FirstBoss)

    OnSavePoint(Agent: agent):void =
        StartScene(Agent, scene.SavePoint)

    OnLastCrystal(Agent: agent):void =
        StartScene(Agent, scene.LastCrystal)

    OnPortal(Agent: agent):void =
        StartScene(Agent, scene.Portal)

    StartScene(Agent: agent, Scene: scene):void=
        SetLinesProviderIfNeed(Agent)
        Lines := GetLinesList(LinesProvider, Scene)
        spawn{StartLines(Agent, Lines)}

    GetLinesList(Provider :lines_provider, Scene: scene):[]line =
        case(Scene):
            scene.Introduction1 => return Provider.Introduction1LinesList()
            scene.Introduction2 => return Provider.Introduction2LinesList()
            scene.Introduction3 => return Provider.Introduction3LinesList()
            scene.FirstBoss     => return Provider.FirstBossLinesList()
            scene.FirstCrystal  => return Provider.FirstCrystalLinesList()
            scene.SavePoint     => return Provider.SavePointLinesList()
            scene.LastCrystal   => return Provider.LastCrystalLinesList()
            scene.Portal     => return Provider.PortalLinesList()
            scene.DefeatLassBoss     => return Provider.DefeatLassBossLinesList()
            scene.Jaeger     => return Provider.JaegerList()
            scene.Fennix     => return Provider.FennixList()
            scene.Frontier   => return Provider.FrontierList()
            scene.Penny      => return Provider.PennyList()
            scene.Rebel      => return Provider.RebelList()
            scene.SeaWolf    => return Provider.SeaWolfList()
        
        
    StartLines(Agent: agent, Lines: []line)<suspends>:void =
        if (IsStarted = true):
            return
        set IsStarted = true
        # player_uiを取得
        if (Player := player[Agent], PlayerUI := GetPlayerUI[Player]):
            for(Index : int = 0..Lines.Length - 1 ):
                if (Line := Lines[Index]):
                    NewUI := CreateMyUI(Line)
                    PlayerUI.AddWidget(NewUI, player_ui_slot{InputMode := ui_input_mode.None})
                    Sleep(GetDuration(Line.Duration))
                    PlayerUI.RemoveWidget(NewUI)
                    Sleep(0.5)
        set IsStarted = false

    GetDuration<private>(Duration: duration):float =
        if (Duration = duration.Short):
            return 5.0
        else:
            return 8.0

    GetSceneDuration(Agent: agent, Scene: scene): float =
        SetLinesProviderIfNeed(Agent)
        Lines := GetLinesList(LinesProvider, Scene)
        return GetTotalDuration(Lines)

    GetTotalDuration<private>(Lines: []line): float =
        var TotalDuration:float = 0.0
        for(Index : int = 0..Lines.Length - 1 ):
            if (Line := Lines[Index]):
                set TotalDuration += GetDuration(Line.Duration)
        return TotalDuration

    # UI作成
    CreateMyUI(Line: line): canvas=
         # キャンバスウィジェット
        MyCanvas : canvas = canvas:
            Slots := array:
                canvas_slot: #Character
                    Anchors := anchors{Minimum := vector2{X := 0.1, Y := 0.3}, Maximum := vector2{X := 0.1, Y := 0.3} }
                    Offsets := margin{Top := 50.0, Left := 10.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X := 0.5, Y := 0.5}
                    ZOrder := 0
                    SizeToContent := true
                    Widget := texture_block:
                        DefaultImage := Line.Character
                        DefaultDesiredSize := vector2{X := 200.0, Y := 200.0} 
                canvas_slot: #Sentence
                    Anchors := anchors{Minimum := vector2{X := 0.5, Y := 0.35}, Maximum := vector2{X := 0.5, Y := 0.35} }
                    Offsets := margin{Top := 0.0, Left := 20.0, Right := 0.0, Bottom := 0.0}
                    Alignment := vector2{X := 0.5, Y := 0.5}
                    SizeToContent := true
                    Widget := texture_block:
                        DefaultImage := Line.Sentence
                        DefaultDesiredSize := vector2{X := 1280.0, Y := 170.4} 
        return MyCanvas

    DeleteMyUI(Message : widget_message) : void=      
        if:
            PlayerUI := GetPlayerUI[Message.Player]
            MyUI := MaybeMyUIPerPlayer[Message.Player]?
        then:
            # プレイヤー画面から作成したUIを削除
            PlayerUI.RemoveWidget(MyUI)
 
            # データ上のプレイヤーに紐づくUIを削除(false)
            if (set MaybeMyUIPerPlayer[Message.Player] = false){}
 
