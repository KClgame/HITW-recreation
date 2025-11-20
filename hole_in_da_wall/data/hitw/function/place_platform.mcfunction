# 本函数的执行者就是玩家本人（@s = 选择平台的玩家）
# 直接根据 @s 的 platform 分数遍历放置结构

execute if score @s platform matches 1 run place template minecraft:platform1 -6 0 -11 none none 1
execute if score @s platform matches 2 run place template minecraft:platform2 -6 0 -11 none none 1
execute if score @s platform matches 3 run place template minecraft:platform3 -6 0 -11 none none 1
execute if score @s platform matches 4 run place template minecraft:platform4 -6 0 -11 none none 1
execute if score @s platform matches 5 run place template minecraft:platform5 -6 0 -11 none none 1
execute if score @s platform matches 6 run place template minecraft:platform6 -6 0 -11 none none 1
execute if score @s platform matches 7 run place template minecraft:platform7 -6 0 -11 none none 1
execute if score @s platform matches 8 run place template minecraft:platform8 -6 0 -11 none none 1
execute if score @s platform matches 9 run place template minecraft:platform9 -6 0 -11 none none 1
execute if score @s platform matches 10 run place template minecraft:platform10 -6 0 -11 none none 1
execute if score @s platform matches 11 run place template minecraft:platform11 -6 0 -11 none none 1
execute if score @s platform matches 12 run place template minecraft:platform12 -6 0 -11 none none 1
execute if score @s platform matches 13 run place template minecraft:platform13 -6 0 -11 none none 1
execute if score @s platform matches 14 run place template minecraft:platform14 -6 0 -11 none none 1
execute if score @s platform matches 15 run place template minecraft:platform15 -6 0 -11 none none 1

# 非法值保护（不在1~15），默认给 platform1
execute unless score @s platform matches 1..15 run place template minecraft:platform1 -6 0 -11 none none 1