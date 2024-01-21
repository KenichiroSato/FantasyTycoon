
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.


lines_provider := interface():
    Introduction1LinesList() : []line
    Introduction2LinesList() : []line
    Introduction3LinesList() : []line
    FirstBossLinesList() : []line
    FirstCrystalLinesList() : []line
    SavePointLinesList() : []line
    LastCrystalLinesList() : []line
    PortalLinesList() : []line
    DefeatLinesList() : []line

english_lines_provider := class(lines_provider):

    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10, Duration := duration.Long}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s30, Duration := duration.Long}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40, Duration := duration.Long}
    }

    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s70, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80, Duration := duration.Long}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s110, Duration := duration.Long}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s140, Duration := duration.Long}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s170, Duration := duration.Long}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s200, Duration := duration.Long}
    }

    DefeatLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s230, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s240, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s250, Duration := duration.Long}
    }

japanese_lines_provider := class(lines_provider):
    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10, Duration := duration.Long}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s30, Duration := duration.Long}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40, Duration := duration.Long}
    }


    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s70, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80, Duration := duration.Long}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s110, Duration := duration.Long}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s140, Duration := duration.Long}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s170, Duration := duration.Long}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s200, Duration := duration.Long}
    }

    DefeatLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s230, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s240, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s250, Duration := duration.Long}
    }


spanish_lines_provider := class(lines_provider):
    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10, Duration := duration.Long}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s30, Duration := duration.Long}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40, Duration := duration.Long}
    }

    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s70, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80, Duration := duration.Long}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s110, Duration := duration.Long}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s140, Duration := duration.Long}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s170, Duration := duration.Long}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s200, Duration := duration.Long}
    }

    DefeatLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s230, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s240, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s250, Duration := duration.Long}
    }

french_lines_provider := class(lines_provider):
    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10, Duration := duration.Long}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s30, Duration := duration.Long}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40, Duration := duration.Long}
    }

    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s70, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80, Duration := duration.Long}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s110, Duration := duration.Long}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s140, Duration := duration.Long}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s170, Duration := duration.Long}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s200, Duration := duration.Long}
    }

    DefeatLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s230, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s240, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s250, Duration := duration.Long}
    }
