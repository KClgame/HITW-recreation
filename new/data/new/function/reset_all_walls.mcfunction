# 重置当前玩家的所有计数
scoreboard players set @s survived_walls 0
scoreboard players set @s temp_20 0

tellraw @a [{"text":"[Survived Walls]","color":"gold","bold":true},{"text":" 所有墙数已重置为 0！（由 ","color":"red"},{"selector":"@s"},{"text":" 执行）","color":"red"}]
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 0.8
title @a title {"text":"RESET!","color":"red","bold":true}
title @a subtitle {"text":"所有计数已清零","color":"gray"}