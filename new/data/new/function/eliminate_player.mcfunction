# new:eliminate_player.mcfunction （被淘汰的玩家是 @s）

# Step 1: 红字粗体淘汰标题 3秒
title @p times 0t 60t 0t
title @p title {"text":"You are eliminated!","color":"red","bold":true}

# Step 2: 传送到观战区 + 音效
tp @p -13 1 -2
playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 2 0.8
playsound minecraft:entity.lightning_bolt.thunder master @s ~ ~ ~ 2 1

# Step 3: 立即停止所有游戏进程（多人时也生效）
kill @e[tag=piston,tag=north]
schedule clear new:north_step
schedule clear new:north_button
schedule clear new:kill_north_pistons
# 如果你现在用的是玩家个人开关，就改成下面这行（推荐）
scoreboard players set @a random_on 0
# 如果你还用全局 $random，就保留这行：
# scoreboard players set $random random_on 0

# Step 4: 清场
fill 7 5 -15 -7 1 8 air replace

# Step 5: 3秒后结算（使用修复过的 final_score）
schedule function new:final_score 60t append