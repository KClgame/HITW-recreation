# hitweast:return_check.mcfunction （40% 概率回弹）
execute as @p store result score @p return_random run random value 1..10

execute if score @p return_random matches 1..4 run schedule function hitweast:kill_east_pistons 1t replace

# east 墙前进方向 +x，前方两格 ~2 ~ ~，反向 facing=west
execute if score @p return_random matches 1..4 as @e[tag=piston,tag=east] at @s run setblock ~2 ~ ~ minecraft:sticky_piston[facing=west]
execute if score @p return_random matches 1..4 as @e[tag=piston,tag=east] at @s run setblock ~ ~ ~ air

execute if score @p return_random matches 1..4 run scoreboard players set @p returned 1

scoreboard players reset @p return_random