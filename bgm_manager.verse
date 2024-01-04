
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
bgm_manager := class(creative_device):

    @editable LasBossBgmPlayer: audio_player_device = audio_player_device{}
    @editable BattleBgmPlayer: audio_player_device = audio_player_device{}
    @editable NormalBgmPlayer: audio_player_device = audio_player_device{}
    @editable MonsterDefeatedSoundPlayer: audio_player_device = audio_player_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void= {}

    PlayNormalBgm():void =
        LasBossBgmPlayer.Stop()
        BattleBgmPlayer.Stop()
        NormalBgmPlayer.Play()

    PlayBattleBgm():void =
        LasBossBgmPlayer.Stop()
        NormalBgmPlayer.Stop()
        BattleBgmPlayer.Play()

    PlayLassBossBgm():void =
        NormalBgmPlayer.Stop()
        BattleBgmPlayer.Stop()
        LasBossBgmPlayer.Play()

    OnMonsterDefeated():void =
        spawn{PlayMonsterDefeated()}
        
    PlayMonsterDefeated()<suspends>:void =
        BattleBgmPlayer.Stop()
        LasBossBgmPlayer.Stop()
        MonsterDefeatedSoundPlayer.Play()
        Sleep(4.0)
        NormalBgmPlayer.Play()