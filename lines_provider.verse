
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
    JaegerList() : []line
    FennixList() : []line
    FrontierList() : []line
    PennyList() : []line
    RebelList() : []line
    SeaWolfList() : []line

english_lines_provider := class(lines_provider):

    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10, Duration := duration.Short}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s30, Duration := duration.Short}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40, Duration := duration.Long}
    }

    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s70, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80, Duration := duration.Short}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s110, Duration := duration.Long}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s140, Duration := duration.Short}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s170, Duration := duration.Short}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s200, Duration := duration.Short}
    }

    DefeatLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s230, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s240, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s250, Duration := duration.Short}
    }

    JaegerList<override>() : []line = array{
        line {Character := assets.Jaeger, Sentence := assets.s_Jaeger, Duration := duration.Long}
    }
    FennixList<override>() : []line = array{
        line {Character := assets.Fennix, Sentence := assets.s_fennix, Duration := duration.Long}
    }
    FrontierList<override>() : []line = array{
        line {Character := assets.Frontier, Sentence := assets.s_frontier, Duration := duration.Long}
    }
    PennyList<override>() : []line = array{
        line {Character := assets.Penny, Sentence := assets.s_penny, Duration := duration.Long}
    }
    RebelList<override>() : []line = array{
        line {Character := assets.Rebel, Sentence := assets.s_rebel, Duration := duration.Long}
    }
    SeaWolfList<override>() : []line = array{
        line {Character := assets.SeaWolf, Sentence := assets.s_seawolf, Duration := duration.Long}
    }

japanese_lines_provider := class(lines_provider):
    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10, Duration := duration.Short}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s30, Duration := duration.Short}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40, Duration := duration.Short}
    }


    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s70, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s80, Duration := duration.Short}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s110, Duration := duration.Short}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s140, Duration := duration.Short}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s170, Duration := duration.Short}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s200, Duration := duration.Short}
    }

    DefeatLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s230, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s240, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s250, Duration := duration.Short}
    }

    JaegerList<override>() : []line = array{
        line {Character := assets.Jaeger, Sentence := assets.s_Jaeger, Duration := duration.Long}
    }
    FennixList<override>() : []line = array{
        line {Character := assets.Fennix, Sentence := assets.s_fennix, Duration := duration.Long}
    }
    FrontierList<override>() : []line = array{
        line {Character := assets.Frontier, Sentence := assets.s_frontier, Duration := duration.Long}
    }
    PennyList<override>() : []line = array{
        line {Character := assets.Penny, Sentence := assets.s_penny, Duration := duration.Long}
    }
    RebelList<override>() : []line = array{
        line {Character := assets.Rebel, Sentence := assets.s_rebel, Duration := duration.Long}
    }
    SeaWolfList<override>() : []line = array{
        line {Character := assets.SeaWolf, Sentence := assets.s_seawolf, Duration := duration.Long}
    }

spanish_lines_provider := class(lines_provider):
    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10, Duration := duration.Short}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s30, Duration := duration.Short}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40, Duration := duration.Long}
    }

    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s70, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80, Duration := duration.Short}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s110, Duration := duration.Long}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s140, Duration := duration.Short}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s170, Duration := duration.Short}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s200, Duration := duration.Short}
    }

    DefeatLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s230, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s240, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s250, Duration := duration.Short}
    }

    JaegerList<override>() : []line = array{
        line {Character := assets.Jaeger, Sentence := assets.s_Jaeger, Duration := duration.Long}
    }
    FennixList<override>() : []line = array{
        line {Character := assets.Fennix, Sentence := assets.s_fennix, Duration := duration.Long}
    }
    FrontierList<override>() : []line = array{
        line {Character := assets.Frontier, Sentence := assets.s_frontier, Duration := duration.Long}
    }
    PennyList<override>() : []line = array{
        line {Character := assets.Penny, Sentence := assets.s_penny, Duration := duration.Long}
    }
    RebelList<override>() : []line = array{
        line {Character := assets.Rebel, Sentence := assets.s_rebel, Duration := duration.Long}
    }
    SeaWolfList<override>() : []line = array{
        line {Character := assets.SeaWolf, Sentence := assets.s_seawolf, Duration := duration.Long}
    }

french_lines_provider := class(lines_provider):
    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10, Duration := duration.Short}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s30, Duration := duration.Short}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40, Duration := duration.Long}
    }

    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s70, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80, Duration := duration.Short}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s110, Duration := duration.Long}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s140, Duration := duration.Short}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s170, Duration := duration.Short}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s200, Duration := duration.Short}
    }

    DefeatLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s230, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s240, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s250, Duration := duration.Short}
    }

    JaegerList<override>() : []line = array{
        line {Character := assets.Jaeger, Sentence := assets.s_Jaeger, Duration := duration.Long}
    }
    FennixList<override>() : []line = array{
        line {Character := assets.Fennix, Sentence := assets.s_fennix, Duration := duration.Long}
    }
    FrontierList<override>() : []line = array{
        line {Character := assets.Frontier, Sentence := assets.s_frontier, Duration := duration.Long}
    }
    PennyList<override>() : []line = array{
        line {Character := assets.Penny, Sentence := assets.s_penny, Duration := duration.Long}
    }
    RebelList<override>() : []line = array{
        line {Character := assets.Rebel, Sentence := assets.s_rebel, Duration := duration.Long}
    }
    SeaWolfList<override>() : []line = array{
        line {Character := assets.SeaWolf, Sentence := assets.s_seawolf, Duration := duration.Long}
    }
