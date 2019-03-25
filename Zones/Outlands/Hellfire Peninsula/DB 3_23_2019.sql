-- Table `creature_template` fix visible trigger creatures
UPDATE `creature_template` SET `flags_extra` = 128 WHERE (entry = 22002);
UPDATE `creature_template` SET `flags_extra` = 128 WHERE (entry = 21993);
UPDATE `creature_template` SET `flags_extra` = 128 WHERE (entry = 22001);

UPDATE `creature_template` SET `ScriptName`='npc_infernal_rain_hellfire' WHERE  `entry`=18729;
UPDATE `creature_template` SET `flags_extra`='128' WHERE  `entry`=18729;