-- Trigger NPC was visible. This will make it invisible to players.
UPDATE `creature_template` SET `flags_extra`='128' WHERE  `entry`=34575;
-- The quest Gnarlpine Corruption ends at NPC 2078, but the quest also ended at 2107. This will fix the issue.
DELETE FROM `creature_involvedrelation` WHERE  `id`=2107 AND `quest`=476;