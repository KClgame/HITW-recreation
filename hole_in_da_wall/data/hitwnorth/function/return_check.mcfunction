# hitwnorth:return_check.mcfunction （40% 概率回弹）

# Step 1: 随机 1..10
execute as @p store result score @p return_random run random value 1..10

# Step 2: 成功回弹（1..4）
#execute if score @p return_random matches 1..4 run tellraw @a [{"text":"[Return！] ","color":"red","bold":true},{"text":"墙体突然反向！","color":"gold"}]
#execute if score @p return_random matches 1..4 run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 2 0.8
#execute if score @p return_random matches 1..4 run particle minecraft:reverse_portal ~ ~2 ~ 3 3 3 0.3 500 force

# 立刻杀死当前北向活塞（截断运动）
execute if score @p return_random matches 1..4 run schedule function hitwnorth:kill_north_pistons 1t replace

# 修正版：以每个盔甲架自身为基准，向其“前进方向”前方两格放置一个反向 sticky_piston
# north 墙前进方向是 -z，所以前方两格是 ~ ~ ~-2，反向 facing=south
execute if score @p return_random matches 1..4 as @e[tag=piston,tag=north] at @s run setblock ~ ~ ~-2 minecraft:sticky_piston[facing=south]
execute if score @p return_random matches 1..4 as @e[tag=piston,tag=north] at @s run setblock ~ ~ ~ air

# 标记已经 return 过，防止同一面墙重复触发
execute if score @p return_random matches 1..4 run scoreboard players set @p returned 1

# Step 3: 失败（5..10）什么都不做，直接继续正常推进
#execute if score @p return_random matches 5..10 run tellraw @a [{"text":"[Return 失败] ","color":"gray"},{"text":"墙体继续前进...","color":"white"}]

# 清理临时随机分数
scoreboard players reset @p return_random
scoreboard players set @p returned 0