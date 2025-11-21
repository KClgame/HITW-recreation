# ====== north_step.mcfunction ====== （加入 Return 系统）

execute as @e[tag=piston,tag=north] at @s run fill ~ ~ ~ ~ ~ ~1 air strict
execute as @e[tag=piston,tag=north] at @s run setblock ~ ~ ~-1 minecraft:sticky_piston[facing=north] strict
execute as @e[tag=piston,tag=north] at @s run tp @s ~ ~ ~-1

scoreboard players add @e[tag=piston,tag=north] loop_count 1

# ===== Return Check（只在 loop_count=27 且尚未 return 过时执行）=====
execute as @e[tag=piston,tag=north,scores={loop_count=27},limit=1] at @s if score @p returned matches 0 if score @p random_on matches 1 run function hitwnorth:return_check

# 叮的一声（保持 30 时播放）
execute as @e[tag=piston,tag=north,scores={loop_count=30},limit=1] at @p run playsound minecraft:block.note_block.pling master @p ~ ~ ~ 1 1.8

# ============ 玩家绑定计数核心 ============
execute as @e[tag=piston,tag=north,scores={loop_count=30},limit=1] at @s run scoreboard players add @p survived_walls 1
execute as @e[tag=piston,tag=north,scores={loop_count=30},limit=1] at @s run scoreboard players add @p temp_20 1

# 每正好20面墙触发一次庆祝，然后临时计数归零
execute as @e[tag=piston,tag=north,scores={loop_count=30},limit=1] at @s if score @p temp_20 matches 20 run function final:big_celebration
execute as @e[tag=piston,tag=north,scores={loop_count=30},limit=1] at @s if score @p temp_20 matches 20 run scoreboard players set @p temp_20 0

# ===== 墙体正常结束时重置 returned 计数（防止下一面墙无法 return）=====
execute as @e[tag=piston,tag=north,scores={loop_count=30},limit=1] run scoreboard players set @p returned 0

# 清理 + 准备下一面墙（保持 append，避免循环断裂）
execute as @e[tag=piston,tag=north,scores={loop_count=30},limit=1] run schedule function hitwnorth:kill_north_pistons 1t append
execute if entity @e[tag=piston,tag=north,scores={loop_count=..29}] run schedule function hitwnorth:north_button 1t append
execute if entity @e[tag=piston,tag=north,scores={loop_count=30}] as @p run function random:random_check