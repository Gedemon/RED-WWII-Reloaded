
----------------------------------------------------------
-- ArtDefine_Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type,	LandmarkType,	FriendlyName) VALUES
('ART_DEF_IMPROVEMENT_DEPOT',				'Improvement',	'Depot'		),
('ART_DEF_IMPROVEMENT_AIRFIELD',			'Improvement',	'Airfield'	),
('ART_DEF_IMPROVEMENT_TOWER',				'Improvement',	'Tower'		),
('ART_DEF_IMPROVEMENT_BUNKER',				'Improvement',	'Bunker'	);

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES
('ART_DEF_IMPROVEMENT_DEPOT',			'Improvement',	'DepotIcon256.dds'	),
('ART_DEF_IMPROVEMENT_AIRFIELD',		'Improvement',	'sv_landmark.dds'	),
('ART_DEF_IMPROVEMENT_TOWER',			'Improvement',	'SV_Watchtower256.dds'	),
('ART_DEF_IMPROVEMENT_BUNKER',			'Improvement',	'sv_landmark.dds'	);


INSERT INTO ArtDefine_Landmarks (Era, State, Scale,	ImprovementType,					LayoutHandler,	ResourceType,					Model,						TerrainContour) VALUES
('Any', 'UnderConstruction',	1,  				'ART_DEF_IMPROVEMENT_DEPOT',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Depot Postapocalyptic HB.fxsxml',	1	),
('Any', 'Constructed',			1,  				'ART_DEF_IMPROVEMENT_DEPOT',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Depot Postapocalyptic B.fxsxml',	1	),
('Any', 'Pillaged',				1,  				'ART_DEF_IMPROVEMENT_DEPOT',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Depot Postapocalyptic PL.fxsxml',	1	),
('Any', 'UnderConstruction',	1,  				'ART_DEF_IMPROVEMENT_AIRFIELD',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Airfield_Era1_HB.fxsxml',			1	),
('Any', 'Constructed',			1,  				'ART_DEF_IMPROVEMENT_AIRFIELD',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Airfield_Era1.fxsxml',				1	),
('Any', 'Pillaged',				1,  				'ART_DEF_IMPROVEMENT_AIRFIELD',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Airfield_Era1_PL.fxsxml',			1	),
('Any', 'UnderConstruction',	1,  				'ART_DEF_IMPROVEMENT_TOWER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'WatchTower_HB.fxsxml',				1	),
('Any', 'Constructed',			1,  				'ART_DEF_IMPROVEMENT_TOWER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'WatchTower.fxsxml',				1	),
('Any', 'Pillaged',				1,  				'ART_DEF_IMPROVEMENT_TOWER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'WatchTower.fxsxml',				1	),
('Any', 'UnderConstruction',	1,  				'ART_DEF_IMPROVEMENT_BUNKER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Bunker_HB.fxsxml',					1	),
('Any', 'Constructed',			1,  				'ART_DEF_IMPROVEMENT_BUNKER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Bunker_B.fxsxml',					1	),
('Any', 'Pillaged',				1,  				'ART_DEF_IMPROVEMENT_BUNKER',		'RANDOM',		'ART_DEF_RESOURCE_NONE',		'Bunker_PL.fxsxml',					1	);

----------------------------------------------------------
-- Improvements
----------------------------------------------------------
INSERT INTO Improvements (Type,	Description,		Civilopedia,	ArtDefineTag,	Water,	PillageGold,	Permanent,	OutsideBorders, DestroyedWhenPillaged,	DefenseModifier,	PortraitIndex,	IconAtlas) VALUES
('IMPROVEMENT_DEPOT',	'Depot',	'Depot',	'ART_DEF_IMPROVEMENT_DEPOT',		0,		0,				1,			1,				0,						0,					54,	'UNIT_ACTION_ATLAS'	),
('IMPROVEMENT_AIRFIELD','Airfield',	'Airfield',	'ART_DEF_IMPROVEMENT_AIRFIELD',		0,		0,				1,			1,				0,						0,					54,	'UNIT_ACTION_ATLAS'	),
('IMPROVEMENT_TOWER',	'Tower',	'Tower',	'ART_DEF_IMPROVEMENT_TOWER',		0,		0,				1,			1,				0,						0,					54,	'UNIT_ACTION_ATLAS'	),
('IMPROVEMENT_BUNKER',	'Bunker',	'Bunker',	'ART_DEF_IMPROVEMENT_BUNKER',		0,		0,				1,			1,				0,						50,					54,	'UNIT_ACTION_ATLAS'	);

INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES
('IMPROVEMENT_DEPOT',			'TERRAIN_GRASS' ),
('IMPROVEMENT_DEPOT',			'TERRAIN_PLAINS'),
('IMPROVEMENT_DEPOT',			'TERRAIN_DESERT'),
('IMPROVEMENT_DEPOT',			'TERRAIN_TUNDRA'),
('IMPROVEMENT_DEPOT',			'TERRAIN_SNOW'	),
('IMPROVEMENT_AIRFIELD',		'TERRAIN_GRASS' ),
('IMPROVEMENT_AIRFIELD',		'TERRAIN_PLAINS'),
('IMPROVEMENT_AIRFIELD',		'TERRAIN_DESERT'),
('IMPROVEMENT_AIRFIELD',		'TERRAIN_TUNDRA'),
('IMPROVEMENT_AIRFIELD',		'TERRAIN_SNOW'	),
('IMPROVEMENT_TOWER',			'TERRAIN_GRASS' ),
('IMPROVEMENT_TOWER',			'TERRAIN_PLAINS'),
('IMPROVEMENT_TOWER',			'TERRAIN_DESERT'),
('IMPROVEMENT_TOWER',			'TERRAIN_TUNDRA'),
('IMPROVEMENT_TOWER',			'TERRAIN_SNOW'	),
('IMPROVEMENT_BUNKER',			'TERRAIN_GRASS' ),
('IMPROVEMENT_BUNKER',			'TERRAIN_PLAINS'),
('IMPROVEMENT_BUNKER',			'TERRAIN_DESERT'),
('IMPROVEMENT_BUNKER',			'TERRAIN_TUNDRA'),
('IMPROVEMENT_BUNKER',			'TERRAIN_SNOW'	);
