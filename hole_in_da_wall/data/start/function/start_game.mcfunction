# 原有功能不变
tp @p 0 11 -9
execute as @p at @s run function start:countdown_3
scoreboard players set @p random_on 1

# ===== 新增：纯遍历放置玩家自选平台 =====
execute as @p at @s run function start:place_platform

tag @p add in_game

fill -14 11 2 -6 16 -11 air
fill -6 16 -11 7 11 -19 air
fill 15 11 -11 7 16 2 air
fill 7 16 2 -6 11 10 air
fill -6 16 2 7 11 -11 air
# ===== 新增：初始化玩家方向数据 =====
scoreboard players set @p side 0

#function random:load
