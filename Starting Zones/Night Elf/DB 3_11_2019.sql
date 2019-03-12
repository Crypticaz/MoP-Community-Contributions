-- Training Dummies were missing scripts in Shadowglen (night elf starting zone) and would attack you. Here is a quick fix.
UPDATE `creature_template` SET `ScriptName`='npc_training_dummy' WHERE  `entry`=44614;
-- Quest Iverron's Antidote gameobject type was missing some data for gameobject_template along with loot.
UPDATE `gameobject_template` SET `data1`='9605', `data8`='28724', `flags`='4' WHERE  `entry`=207346;
INSERT `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES ('9605', '10641', '-100');