-- Last Rites First Rites Quest Fix
SET @CHIEF_HAWKWIND := 2981;
SET @HARUUT := 3059;
SET @HELAKU := 37737;
SET @RAVENFEATHER := 37724;
SET @GART := 3060;
SET @LANKA := 3061;
SET @MEELA := 3062;
SET @OFFERING_BUNNY := 38438;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=@OFFERING_BUNNY;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@CHIEF_HAWKWIND,@OFFERING_BUNNY);

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (@CHIEF_HAWKWIND);
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(@CHIEF_HAWKWIND, 0, 0, 'Earth Mother, into your arms we give one of our own. She is Unaya Hawkwind, my mother, and Greatmother to us all; the wisest of our tribe.', 12, 0, 100, 1, 0, 0, 0, ''),
(@CHIEF_HAWKWIND, 1, 0, 'May her spirit fly to you swiftly; may the winds carry her gently, and the grass whisper her name.', 12, 0, 100, 1, 0, 0, 0, ''),
(@CHIEF_HAWKWIND, 2, 0, 'Watch over her as she has watched over us; let her look down on us with joy, through the eternal gaze of An\'she and Mu\'sha, until we too join her in death.', 12, 0, 100, 1, 0, 0, 0, ''),
(@CHIEF_HAWKWIND, 3, 0, 'For we are all born of you, and shall all return to you.', 12, 0, 100, 1, 0, 0, 0, '');

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_HAWKWIND,@OFFERING_BUNNY)  AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_HAWKWIND*100,@CHIEF_HAWKWIND*100+1,@CHIEF_HAWKWIND*100+2,@CHIEF_HAWKWIND*100+3,@CHIEF_HAWKWIND*100+4,@CHIEF_HAWKWIND*100+5,@CHIEF_HAWKWIND*100+6) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@CHIEF_HAWKWIND, 0, 0, 0, 19, 0, 100, 1, 24861, 0, 0, 0, 80, @CHIEF_HAWKWIND*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Hawkwind - On Quest Accept - Run Script'),
(@OFFERING_BUNNY, 0, 1, 0, 60, 0, 100, 0, 5000, 6000, 16000, 19000, 87, @CHIEF_HAWKWIND*100+1, @CHIEF_HAWKWIND*100+2, @CHIEF_HAWKWIND*100+3, @CHIEF_HAWKWIND*100+4, @CHIEF_HAWKWIND*100+5, @CHIEF_HAWKWIND*100+6, 1, 0, 0, 0, 0, 0, 0, 0, 'Mulgore Offering Credit Bunny - On Update - Run Random Script'),
(@CHIEF_HAWKWIND*100, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 3, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 4, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 5, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 6, 0, 0, 0, 100, 1, 1500, 1500, 1500, 1500, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 0'),
(@CHIEF_HAWKWIND*100, 9, 7, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 1'),
(@CHIEF_HAWKWIND*100, 9, 8, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 2'),
(@CHIEF_HAWKWIND*100, 9, 9, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 3, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 3'),
(@CHIEF_HAWKWIND*100, 9, 10, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 11, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 12, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 13, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 14, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 15, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 16, 61, 0, 0, 100, 0, 0, 0, 0, 0, 33, 38438, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,  'Chief Hawkwind - Give Quest Credit'),
(@CHIEF_HAWKWIND*100, 9, 17, 0, 0, 0, 100, 1, 0, 0, 0, 0, 78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Reset Script'),
(@CHIEF_HAWKWIND*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+2, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+3, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+4, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+5, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+6, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry');