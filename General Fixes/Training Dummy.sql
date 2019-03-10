-- Training Dummy in Sunstrider Isle would attack you and move. Adding the training dummy script to the creature will fix it.
UPDATE `world`.`creature_template` SET `ScriptName`='npc_training_dummy' WHERE  `entry`=44937;
