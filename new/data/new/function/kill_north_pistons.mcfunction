# 重置loop_count
scoreboard players set @e[tag=piston] loop_count 0

# 杀掉旧墙的armor_stand
kill @e[tag=piston,tag=north]

# === 个人随机墙开关逻辑（基于最近玩家 @p）===
# 只有最近玩家开启了随机墙才生成随机墙，否则彻底冻结
execute if score @p random_on matches 1 run function new:random_walls
execute if score @p random_on matches 0 run function new:stop_new_wall