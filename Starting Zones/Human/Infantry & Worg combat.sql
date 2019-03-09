-- Both npcs were just running and attacking worgs out of nowhere, not supposed to be like that. This should do the trick for that part,
-- but the sparring requires scriping via core. Take a look at 
-- https://github.com/Ovahlord/TrinityCore/blob/e30cdbba28778b004e57badfb3b9b52f7fd85fa4/src/server/scripts/EasternKingdoms/zone_elwynn_forest.cpp#L63
-- and https://github.com/Ovahlord/TrinityCore/blob/e30cdbba28778b004e57badfb3b9b52f7fd85fa4/src/server/scripts/EasternKingdoms/zone_elwynn_forest.cpp#L156
 
--Infantry:
UPDATE `world`.`creature_template` SET `dynamicflags`='2048' WHERE  `entry`=49869;
UPDATE `world`.`creature_template` SET `flags_extra`='0' WHERE  `entry`=49869;
UPDATE `world`.`creature_template` SET `faction`='2321' WHERE  `entry`=49869
-- Battle Worg:
UPDATE `world`.`creature_template` SET `flags_extra`='2' WHERE  `entry`=49871;
UPDATE `world`.`creature_template` SET `unit_flags`='33280' WHERE  `entry`=49871;