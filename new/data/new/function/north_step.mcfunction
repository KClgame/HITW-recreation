# ====== north_step.mcfunction ======

execute as @e[tag=piston,tag=north] at @s run fill ~ ~ ~ ~ ~ ~1 air strict
execute as @e[tag=piston,tag=north] at @s run setblock ~ ~ ~-1 minecraft:sticky_piston[facing=north] strict
execute as @e[tag=piston,tag=north] at @s run tp @s ~ ~ ~-1

scoreboard players add @e[tag=piston,tag=north] loop_count 1

# 叮的一声
execute as @e[tag=piston,tag=north,scores={loop_count=24},limit=1] at @p run playsound minecraft:block.note_block.pling master @p ~ ~ ~ 1 1.8

# ============ 玩家绑定计数核心 ============
# 只要这面墙走完24步，就给最近的玩家（或所有玩家）+1
execute as @e[tag=piston,tag=north,scores={loop_count=24},limit=1] at @s run scoreboard players add @p survived_walls 1
execute as @e[tag=piston,tag=north,scores={loop_count=24},limit=1] at @s run scoreboard players add @p temp_20 1

# 每正好20面墙触发一次庆祝，然后临时计数归零
execute as @e[tag=piston,tag=north,scores={loop_count=24},limit=1] at @s if score @p temp_20 matches 20 run function new:big_celebration
execute as @e[tag=piston,tag=north,scores={loop_count=24},limit=1] at @s if score @p temp_20 matches 20 run scoreboard players set @p temp_20 0

# 清理 + 准备下一面墙
execute as @e[tag=piston,tag=north,scores={loop_count=24},limit=1] run schedule function new:kill_north_pistons 1t append
execute if entity @e[tag=piston,tag=north,scores={loop_count=..23}] run schedule function new:north_button 1t replace