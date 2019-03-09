-- Training Dummy's would attack you and move. This should fix it.
UPDATE `world`.`creature_template` SET `unit_flags2`='0' WHERE  `entry`=44937;
UPDATE `world`.`creature_template` SET `ScriptName`='npc_training_dummy' WHERE  `entry`=44937;
UPDATE `world`.`creature_template` SET `flags_extra`='66' WHERE  `entry`=44937;
UPDATE `world`.`creature_template` SET `HoverHeight`='0' WHERE  `entry`=44937;
UPDATE `world`.`creature_template` SET `unit_flags`='131076' WHERE  `entry`=44937;