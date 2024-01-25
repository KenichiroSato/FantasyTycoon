
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
    SecondCrystalLinesList() : []line
    ThirdCrystalLinesList() : []line
    SavePointLinesList() : []line
    LastCrystalLinesList() : []line
    PortalLinesList() : []line
    DefeatLassBossLinesList() : []line
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
    
    SecondCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s300, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s310, Duration := duration.Short}
    }

    ThirdCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s320, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s330, Duration := duration.Short}
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

    DefeatLassBossLinesList<override>() : []line = array{
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
        line {Character := assets.Gia, Sentence := assets.s10_ja, Duration := duration.Short}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s30_ja, Duration := duration.Short}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40_ja, Duration := duration.Short}
    }


    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s70_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s80_ja, Duration := duration.Short}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s110_ja, Duration := duration.Short}
    }

    SecondCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s300_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s310_ja, Duration := duration.Short}
    }

    ThirdCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s320_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s330_ja, Duration := duration.Short}
    }


    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s140_ja, Duration := duration.Short}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s170_ja, Duration := duration.Short}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s200_ja, Duration := duration.Short}
    }

    DefeatLassBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s230_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s240_ja, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s250_ja, Duration := duration.Short}
    }

    JaegerList<override>() : []line = array{
        line {Character := assets.Jaeger, Sentence := assets.s_Jaeger_ja, Duration := duration.Long}
    }
    FennixList<override>() : []line = array{
        line {Character := assets.Fennix, Sentence := assets.s_fennix_ja, Duration := duration.Long}
    }
    FrontierList<override>() : []line = array{
        line {Character := assets.Frontier, Sentence := assets.s_frontier_ja, Duration := duration.Long}
    }
    PennyList<override>() : []line = array{
        line {Character := assets.Penny, Sentence := assets.s_penny_ja, Duration := duration.Long}
    }
    RebelList<override>() : []line = array{
        line {Character := assets.Rebel, Sentence := assets.s_rebel_ja, Duration := duration.Long}
    }
    SeaWolfList<override>() : []line = array{
        line {Character := assets.SeaWolf, Sentence := assets.s_seawolf_ja, Duration := duration.Long}
    }

spanish_lines_provider := class(lines_provider):
    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10_es, Duration := duration.Short}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s30_es, Duration := duration.Short}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40_es, Duration := duration.Long}
    }

    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s70_es, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80_es, Duration := duration.Short}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s110_es, Duration := duration.Long}
    }

    SecondCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s300_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s310_es, Duration := duration.Short}
    }

    ThirdCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s320_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s330_es, Duration := duration.Short}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s140_es, Duration := duration.Short}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s170_es, Duration := duration.Short}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s200_es, Duration := duration.Short}
    }

    DefeatLassBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s230_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s240_es, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s250_es, Duration := duration.Short}
    }

    JaegerList<override>() : []line = array{
        line {Character := assets.Jaeger, Sentence := assets.s_Jaeger_es, Duration := duration.Long}
    }
    FennixList<override>() : []line = array{
        line {Character := assets.Fennix, Sentence := assets.s_fennix_es, Duration := duration.Long}
    }
    FrontierList<override>() : []line = array{
        line {Character := assets.Frontier, Sentence := assets.s_frontier_es, Duration := duration.Long}
    }
    PennyList<override>() : []line = array{
        line {Character := assets.Penny, Sentence := assets.s_penny_es, Duration := duration.Long}
    }
    RebelList<override>() : []line = array{
        line {Character := assets.Rebel, Sentence := assets.s_rebel_es, Duration := duration.Long}
    }
    SeaWolfList<override>() : []line = array{
        line {Character := assets.SeaWolf, Sentence := assets.s_seawolf_es, Duration := duration.Long}
    }

french_lines_provider := class(lines_provider):
    Introduction1LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s10_fr, Duration := duration.Short}
    }
    Introduction2LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s20_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s30_fr, Duration := duration.Short}
    }
    Introduction3LinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s40_fr, Duration := duration.Long}
    }

    FirstBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s60_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s70_fr, Duration := duration.Long},
        line {Character := assets.Gia, Sentence := assets.s80_fr, Duration := duration.Short}
    }

    SecondCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s300_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s310_fr, Duration := duration.Short}
    }

    ThirdCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s320_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s330_fr, Duration := duration.Short}
    }

    FirstCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s100_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s110_fr, Duration := duration.Long}
    }

    SavePointLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s130_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s140_fr, Duration := duration.Short}
    }

    LastCrystalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s160_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s170_fr, Duration := duration.Short}
    }

    PortalLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s190_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s200_fr, Duration := duration.Short}
    }

    DefeatLassBossLinesList<override>() : []line = array{
        line {Character := assets.Gia, Sentence := assets.s220_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s230_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s240_fr, Duration := duration.Short},
        line {Character := assets.Gia, Sentence := assets.s250_fr, Duration := duration.Short}
    }

    JaegerList<override>() : []line = array{
        line {Character := assets.Jaeger, Sentence := assets.s_Jaeger_fr, Duration := duration.Long}
    }
    FennixList<override>() : []line = array{
        line {Character := assets.Fennix, Sentence := assets.s_fennix_fr, Duration := duration.Long}
    }
    FrontierList<override>() : []line = array{
        line {Character := assets.Frontier, Sentence := assets.s_frontier_fr, Duration := duration.Long}
    }
    PennyList<override>() : []line = array{
        line {Character := assets.Penny, Sentence := assets.s_penny_fr, Duration := duration.Long}
    }
    RebelList<override>() : []line = array{
        line {Character := assets.Rebel, Sentence := assets.s_rebel_fr, Duration := duration.Long}
    }
    SeaWolfList<override>() : []line = array{
        line {Character := assets.SeaWolf, Sentence := assets.s_seawolf_fr, Duration := duration.Long}
    }
