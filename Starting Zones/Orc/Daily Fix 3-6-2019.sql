-- Fix SAI lazy Peon - 10556.
-- TODO: Find way to get peon to move to pos instead of object, otherwise peon stands directly on top of object

SET @ENTRY1 := 10556;
DELETE FROM smart_scripts WHERE entryOrGuid = 105555 AND source_type = 0;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= @ENTRY;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY1, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On reset (e.g. after reaching home) - Self: Cast spell 17743 on Self"),
(@ENTRY1, 0, 1, 0, 1, 0, 100, 0, 120000, 150000, 120000, 150000, 80, 10555500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 120000 - 150000 seconds [OOC] - Start timed action list id #10555500"),
(@ENTRY1, 0, 2, 3, 8, 0, 100, 0, 19938, 0, 0, 0, 78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spell 19938 hit  - Self: Call OnReset() event"),
(@ENTRY1, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 10555501, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On link - Start timed action list id #10555501");

-- Awoken by self
SET @ENTRY2 := 1055600;
DELETE FROM smart_scripts WHERE entryOrGuid = 10555500 AND source_type = 9;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY2, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Remove aura due to spell 17743"),
(@ENTRY2, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 1000 seconds [IC] - Self: Set walk"),
(@ENTRY2, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 20, 175784, 15, 0, -234.1, -234.1, -234.1, -234.1, "Once [IC] - Self: Move to Closest gameobject 175784 in 15 yards (point id 1)"),
(@ENTRY2, 9, 3, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Time = 6000 seconds [IC] - None: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY2, 9, 4, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 20, 175784, 15, 0, 0, 0, 0, 0, "Time = 1000 seconds [IC] - Self: Look at Closest gameobject 175784 in 15 yards"),
(@ENTRY2, 9, 5, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 75, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 2500 seconds [IC] - Self: Add aura 68442"),
(@ENTRY2, 9, 6, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 28, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 3000 seconds [IC] - Self: Remove aura due to spell 68442"),
(@ENTRY2, 9, 7, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 1, 0, 0, 0, 0, 0, 19, 35114, 15, 0, -228.19, -228.19, -228.19, -228.19, "Time = 1000 seconds [IC] - Self: Move to Closest alive creature 35114 in 15 yards (point id 1)"),
(@ENTRY2, 9, 8, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 4, 6197, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 6000 seconds [IC] - Self: Play sound 6197 to every player in visibility range of Self"),
(@ENTRY2, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set emote state (KNEEL) to 173"),
(@ENTRY2, 9, 10, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 30000 seconds [IC] - Self: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY2, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 20, 175784, 15, 0, -234.1, -234.1, -234.1, -234.1, "Once [IC] - Self: Move to Closest gameobject 175784 in 15 yards (point id 1)"),
(@ENTRY2, 9, 12, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Time = 6000 seconds [IC] - None: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY2, 9, 13, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 20, 175784, 10, 0, 0, 0, 0, 0, "Time = 1000 seconds [IC] - Self: Look at Closest gameobject 175784 in 10 yards"),
(@ENTRY2, 9, 14, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 75, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 2500 seconds [IC] - Self: Add aura 68442"),
(@ENTRY2, 9, 15, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 28, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 3000 seconds [IC] - Self: Remove aura due to spell 68442"),
(@ENTRY2, 9, 16, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 1, 0, 0, 0, 0, 0, 19, 35114, 15, 0, -228.19, -228.19, -228.19, -228.19, "Time = 1000 seconds [IC] - Self: Move to Closest alive creature 35114 in 15 yards (point id 1)"),
(@ENTRY2, 9, 17, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 4, 6197, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 6000 seconds [IC] - Self: Play sound 6197 to every player in visibility range of Self"),
(@ENTRY2, 9, 18, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set emote state (KNEEL) to 173"),
(@ENTRY2, 9, 19, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 5000 seconds [IC] - Self: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY2, 9, 20, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, -231.603, -231.603, -231.603, -231.603, "Once [IC] - Self: Move to position (-231.603, -4452.81, 63.9317, 4.11774) (point id 1)"),
(@ENTRY2, 9, 21, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 11, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 5000 seconds [IC] - Self: Cast spell 17743 on Self");

-- Awoken by spell
SET @ENTRY3 := 1055601;
DELETE FROM smart_scripts WHERE entryOrGuid = 10555501 AND source_type = 9;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY3, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Remove aura due to spell 17743"),
(@ENTRY3, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, "Once [IC] - storedTarget[1]: Talk 0"),
(@ENTRY3, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 115, 6292, 6294, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Plays randomly one of: 6292, 6294, 0, 0, 0 of all"),
(@ENTRY3, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 10556, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, "Once [IC] - storedTarget[1]: Give kill credit 10556"),
(@ENTRY3, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set run"),
(@ENTRY3, 9, 5, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Time = 3000 seconds [IC] - None: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY3, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 20, 175784, 15, 0, -234.1, -234.1, -234.1, -234.1, "Once [IC] - Self: Move to Closest gameobject 175784 in 15 yards (point id 1)"),
(@ENTRY3, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set walk"),
(@ENTRY3, 9, 8, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 20, 175784, 10, 0, 0, 0, 0, 0, "Time = 1000 seconds [IC] - Self: Look at Closest gameobject 175784 in 10 yards"),
(@ENTRY3, 9, 9, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 75, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 2500 seconds [IC] - Self: Add aura 68442"),
(@ENTRY3, 9, 10, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 28, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 3000 seconds [IC] - Self: Remove aura due to spell 68442"),
(@ENTRY3, 9, 11, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 1, 0, 0, 0, 0, 0, 19, 35114, 15, 0, -228.19, -228.19, -228.19, -228.19, "Time = 1000 seconds [IC] - Self: Move to Closest alive creature 35114 in 15 yards (point id 1)"),
(@ENTRY3, 9, 12, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 4, 6197, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 6000 seconds [IC] - Self: Play sound 6197 to every player in visibility range of Self"),
(@ENTRY3, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set emote state (KNEEL) to 173"),
(@ENTRY3, 9, 14, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 30000 seconds [IC] - Self: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY3, 9, 15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 20, 175784, 15, 0, -234.1, -234.1, -234.1, -234.1, "Once [IC] - Self: Move to Closest gameobject 175784 in 15 yards (point id 1)"),
(@ENTRY3, 9, 16, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Time = 6000 seconds [IC] - None: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY3, 9, 17, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 20, 175784, 10, 0, 0, 0, 0, 0, "Time = 1000 seconds [IC] - Self: Look at Closest gameobject 175784 in 10 yards"),
(@ENTRY3, 9, 18, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 75, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 2500 seconds [IC] - Self: Add aura 68442"),
(@ENTRY3, 9, 19, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 28, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 3000 seconds [IC] - Self: Remove aura due to spell 68442"),
(@ENTRY3, 9, 20, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 1, 0, 0, 0, 0, 0, 19, 35114, 15, 0, -228.19, -228.19, -228.19, -228.19, "Time = 1000 seconds [IC] - Self: Move to Closest alive creature 35114 in 15 yards (point id 1)"),
(@ENTRY3, 9, 21, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 4, 6197, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 6000 seconds [IC] - Self: Play sound 6197 to every player in visibility range of Self"),
(@ENTRY3, 9, 22, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set emote state (KNEEL) to 173"),
(@ENTRY3, 9, 23, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 5000 seconds [IC] - Self: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY3, 9, 24, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, -231.603, -231.603, -231.603, -231.603, "Once [IC] - Self: Move to position (-231.603, -4452.81, 63.9317, 4.11774) (point id 1)"),
(@ENTRY3, 9, 25, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 11, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 5000 seconds [IC] - Self: Cast spell 17743 on Self");


