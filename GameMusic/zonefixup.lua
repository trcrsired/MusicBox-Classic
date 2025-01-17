local MusicBox = LibStub("AceAddon-3.0"):GetAddon("MusicBox")

-- This is fixingup the issues manually

MusicBox.zonefixup =
{
[1537] = -- ironforge
{
7318,7319,22750,23803,23804,23806
},
[11] = -- wetlands
{
2533
},
[5157] = -- The Park (Stormwind). It no longer exists in retail wow since deathwing destroyed it
{
3920,	-- Zone-Daranassus
7794,	-- Moment-Darnassus Walking03
{1417240,1417241,1417242,1417243,1417244,1417245,1417246,1417247},	-- Anduin theme. After legion it is rebuilt with Lion's Rest
{1500388,1514201,1514202,1514203,1514204,1514205,1514206}	-- Canticle of Sacrifice. Legion
},
[1637] = -- Orgrimmar
{
2901,	-- Zone-Orgrimmar
6734,	-- Zone-Orgrimmar
},
[8244] = -- Cathedral Square
{
6076,	-- Sacred02
{772741,772742,772743,772744,772745,772746,772747}	-- Jiana Homeland
},
[10523] = -- Wizard's Sanctum
{
6669
},
[2117] = -- Shadow Grave
{
3820	-- Ghost Music
},
[6454] = -- DeathKnell
{
3820	-- Ghost Music
},
[2119] = -- Gallows' End Tavern
{
7083	-- Undead Dance
},
[1497] = -- Undercity
{
5074,	-- Undercity Classic
6080,	-- Undercity Classic Intro
{441821,441823,441824,441825} -- Undercity Cataclysm
},
}

MusicBox.mapidfixup =
{
[311] =
{
23610,	-- MUS_ShadowfangKeep
{53226,53225,53228}	-- Battle Moment 1,2,4 (3 is in MUS_ShadowfangKeep)
}
}
