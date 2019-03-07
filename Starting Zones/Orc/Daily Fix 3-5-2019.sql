-- Some SAI fixes for Lazy Peon. Not 100% but better than what it was.
SET @ENTRY := 10556;
DELETE FROM smart_scripts WHERE entryOrGuid = 10556 AND source_type = 0;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= @ENTRY;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 0, 0, 0, 60, 0, 100, 1, 100, 200, 0, 0, 88, 1055600, 1055601, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time between 100 - 200 seconds - Self: Call random timed action list between range 1055600 and 1055601"),
(@ENTRY, 0, 1, 0, 8, 0, 100, 1, 19938, 0, 0, 0, 80, 1055602, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spell 19938 hit  - Start timed action list id #1055602");

SET @ENTRY := 1055600;
DELETE FROM smart_scripts WHERE entryOrGuid = 1055600 AND source_type = 9;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 28, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Remove aura due to spell 17743"),
(@ENTRY, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set sheath to Unarmed"),
(@ENTRY, 9, 3, 0, 0, 0, 100, 1, 0, 0, 0, 0, 89, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Move in radius 5 yards"),
(@ENTRY, 9, 4, 0, 0, 0, 100, 1, 45000, 45000, 0, 0, 78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 45000 seconds [IC] - Self: Call OnReset() event");

SET @ENTRY := 1055601;
DELETE FROM smart_scripts WHERE entryOrGuid = 1055601 AND source_type = 9;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set emote state (UNIT_NPC_EMOTESTATE) to 0"),
(@ENTRY, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set sheath to Unarmed"),
(@ENTRY, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 89, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Move in radius 8 yards"),
(@ENTRY, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 89, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 1000 seconds [IC] - Self: Stay in place"),
(@ENTRY, 9, 4, 0, 0, 0, 100, 1, 0, 0, 0, 0, 75, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Add aura 17743");

SET @ENTRY := 1055602;
DELETE FROM smart_scripts WHERE entryOrGuid = 1055602 AND source_type = 9;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Action invoker: Talk 0"),
(@ENTRY, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 33, 10556, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Action invoker: Give kill credit 10556"),
(@ENTRY, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 28, 17743, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Remove aura due to spell 17743"),
(@ENTRY, 9, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 20, 175784, 15, 0, 0, 0, 0, 0, "On link - Self: Move to Closest gameobject 175784 in 15 yards (point id 1)"),
(@ENTRY, 9, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, "On link - Self: Move to Closest gameobject 0 in 100 yards (point id 0)"),
(@ENTRY, 9, 6, 0, 0, 0, 100, 1, 1800, 1800, 0, 0, 66, 0, 0, 0, 0, 0, 0, 15, 175784, 5, 0, 0, 0, 0, 0, "Time = 1800 seconds [IC] - Self: Look at Gameobject 175784 in 5 yd"),
(@ENTRY, 9, 7, 0, 0, 0, 100, 1, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set sheath to Melee"),
(@ENTRY, 9, 8, 0, 0, 0, 100, 1, 0, 0, 0, 0, 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Once [IC] - Self: Set emote state (UNIT_NPC_EMOTESTATE) to 234"),
(@ENTRY, 9, 9, 0, 0, 0, 100, 1, 60000, 60000, 0, 0, 78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Time = 60000 seconds [IC] - Self: Call OnReset() event");
