# ====== west_step.mcfunction ======

# 西方向：清理前方，放置后方，实体向西移动
execute as @e[tag=piston,tag=west] at @s run fill ~ ~ ~ ~1 ~ ~ air strict
execute as @e[tag=piston,tag=west] at @s run setblock ~-1 ~ ~ minecraft:sticky_piston[facing=west] strict
execute as @e[tag=piston,tag=west] at @s run tp @s ~-1 ~ ~

scoreboard players add @e[tag=piston,tag=west] loop_count 1

execute as @e[tag=piston,tag=west,scores={loop_count=27},limit=1] at @s if score @p random_on matches 1 if score @p returned matches 0 run function hitwwest:return_check

# 叮的一声
execute as @e[tag=piston,tag=west,scores={loop_count=30},limit=1] at @p run playsound minecraft:block.note_block.pling master @p ~ ~ ~ 1 1.8

# ============ 玩家绑定计数核心 ============
execute as @e[tag=piston,tag=west,scores={loop_count=30},limit=1] at @s run scoreboard players add @p survived_walls 1
execute as @e[tag=piston,tag=west,scores={loop_count=30},limit=1] at @s run scoreboard players add @p temp_20 1

# 每正好20面墙触发一次庆祝，然后临时计数归零
execute as @e[tag=piston,tag=west,scores={loop_count=30},limit=1] at @s if score @p temp_20 matches 20 run function final:big_celebration
execute as @e[tag=piston,tag=west,scores={loop_count=30},limit=1] at @s if score @p temp_20 matches 20 run scoreboard players set @p temp_20 0

execute as @e[tag=piston,tag=west,scores={loop_count=30},limit=1] run scoreboard players set @p returned 0

# 清理 + 准备下一面墙
execute as @e[tag=piston,tag=west,scores={loop_count=30},limit=1] run schedule function hitwwest:kill_west_pistons 1t append
execute if entity @e[tag=piston,tag=west,scores={loop_count=..29}] run schedule function hitwwest:west_button 1t append
execute if entity @e[tag=piston,tag=west,scores={loop_count=30}] as @p run function random:random_check