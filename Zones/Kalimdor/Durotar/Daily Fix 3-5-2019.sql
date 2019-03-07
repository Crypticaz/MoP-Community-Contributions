-- smart_script fix for loss reduction
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (39270) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3927000) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(39270, 0, 0, 0, 1, 0, 100, 0, 2000, 5000, 10000, 20000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - OOC - Say 0'),
(39270, 0, 1, 0, 73, 0, 100, 1, 0, 0, 0, 0, 7, 25179, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - On Spellclick - Add Quest \'Loss Reduction\''),
(39270, 0, 2, 3, 73, 0, 100, 1, 0, 0, 0, 0, 80, 3927000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Remove Spellclick Flag'),


(3927000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Remove Spellclick Flag'),
(3927000, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 57626, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Remove Aura'),
(3927000, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Say 1'),
(3927000, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 39270, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Quest Credit'),
(3927000, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 29, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Follow Invoker'),
(3927000, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 93, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Follow Invoker'),
(3927000, 9, 6, 0, 0, 0, 100, 0, 1600, 1600, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Follow Invoker'),
(3927000, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 102, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Follow Invoker'),
(3927000, 9, 8, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - On TextOver - Say 2'),
(3927000, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - On TextOver - Say 2'),
(3927000, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 213.138, -4939.45, 17.073, 0, 'Injured Razor Hill Grunt - Link - Start WP'),
(3927000, 0, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 53, 1, 39270, 0, 0, 500, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Start WP');
(3927000, 9, 12, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Start WP - Despawn Timer');

-- conditions for loss reduction
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (22) AND `sourceEntry` IN (39270);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 39270, 0, 0, 1, 1, 57626, 0, 0, 0, 0, 0, '', ''),
(22, 2, 39270, 0, 1, 8, 0, 25179, 0, 0, 1, 0, 0, '', ''),
(22, 2, 39270, 0, 1, 28, 0, 25179, 0, 0, 1, 0, 0, '', ''),
(22, 2, 39270, 0, 1, 9, 0, 25179, 0, 0, 1, 0, 0, '', '');