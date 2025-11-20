# 原有功能不变
tp @p 0 1 -9
execute as @p at @s run function start:countdown_3
scoreboard players set @p random_on 1

# ===== 新增：纯遍历放置玩家自选平台 =====
execute as @p at @s run function hitw:place_platform

tag @p add in_game