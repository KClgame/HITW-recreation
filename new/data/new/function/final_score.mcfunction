# new:final_score.mcfunction （正确顺序版：先显示真实墙数 → 再归零）

# Step 1: 先把被淘汰玩家的真实墙数临时保存到 storage（关键！）
execute store result storage temp:eliminate walls int 1 run scoreboard players get @p survived_walls

# Step 2: 清除淘汰标题
title @a title {"text":""}

# 聊天栏结算（金色粗体）
tellraw @a [{"text":"","color":"gold"},{"text":"╔══════════════════════════════╗","bold":true}]
tellraw @a [{"text":"                         ELIMINATED","color":"red","bold":true}]
tellraw @a [{"text":"                         You survived ","color":"yellow"},{"score":{"name":"@p","objective":"survived_walls"},"color":"gold","bold":true},{"text":" walls!","color":"yellow"}]
tellraw @a [{"text":"╚══════════════════════════════╝","color":"gold","bold":true}]

# Step 4: 结算音效
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 2 0.8
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2 1
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 0.8

# Step 5: 现在才真正归零（结算已经显示完了）
scoreboard players set @p survived_walls 0
scoreboard players set @p temp_20 0

# Step 6: 额外提示
tellraw @a [{"text":"[结算] ","color":"dark_red","bold":true},{"selector":"@p"},{"text":" 的存活墙数已归零，可重新开始挑战！","color":"gray"}]
