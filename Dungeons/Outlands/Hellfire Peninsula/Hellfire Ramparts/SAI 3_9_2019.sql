-- Stone Guard Stok'ton Stealth & Emote
SET @ENTRY := 54606;
DELETE FROM smart_scripts WHERE entryOrGuid = 54606 AND source_type = 0;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= @ENTRY;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 0, 0, 10000, 20000, 11, 58506, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 10000 - 20000 seconds (0 - 0s initially) [OOC] - Self: Cast spell 58506 on Self"),
(@ENTRY, 0, 1, 0, 1, 0, 100, 0, 0, 0, 10000, 20000, 5, 27, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 10000 - 20000 seconds (0 - 0s initially) [OOC] - Self: Play emote 27");
-- Advance Scout Chadwick Stealth & Emote
SET @ENTRY := 54603;
DELETE FROM smart_scripts WHERE entryOrGuid = 54603 AND source_type = 0;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= @ENTRY;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 0, 0, 10000, 20000, 11, 58506, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 10000 - 20000 seconds (0 - 0s initially) [OOC] - Self: Cast spell 58506 on Self"),
(@ENTRY, 0, 1, 0, 1, 0, 100, 0, 0, 0, 10000, 20000, 5, 27, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 10000 - 20000 seconds (0 - 0s initially) [OOC] - Self: Play emote 27");
