# hitw:stop_new_wall.mcfunction （个人关闭随机后彻底冻结）

title @a times 10t 40t 20t
title @a title {"text":"RANDOM WALLS","color":"dark_purple","bold":true}
title @a subtitle [{"text":"由 ","color":"gray"},{"selector":"@p"},{"text":" 关闭 · 新墙已冻结","color":"red"}]

tellraw @a [{"text":"[随机墙] ","color":"light_purple","bold":true},{"selector":"@p"},{"text":" 关闭了随机墙！新墙生成已冻结","color":"red","bold":true}]
tellraw @a [{"text":"个人重新开启 → ","color":"gray"},{"text":"/scoreboard players set @s random_on 1","color":"green","bold":true,"underlined":true,"clickEvent":{"action":"suggest_command","value":"/scoreboard players set @s random_on 1"}}]

playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 2 0.5
execute as @a at @s run particle minecraft:dragon_breath ~ ~1 ~ 2 2 2 0.05 300 force