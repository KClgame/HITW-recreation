# hitwsouth:return_check.mcfunction （40% 概率回弹）

execute as @p store result score @p return_random run random value 1..10

# 成功回弹（1..4）
execute if score @p return_random matches 1..4 run schedule function hitwsouth:kill_south_pistons 1t replace

# south 墙前进方向 +z，前方两格 ~ ~ ~2，反向 facing=north
execute if score @p return_random matches 1..4 as @e[tag=piston,tag=south] at @s run setblock ~ ~ ~2 minecraft:sticky_piston[facing=north]
execute if score @p return_random matches 1..4 as @e[tag=piston,tag=south] at @s run setblock ~ ~ ~ air

execute if score @p return_random matches 1..4 run scoreboard players set @p returned 1

scoreboard players reset @p return_random