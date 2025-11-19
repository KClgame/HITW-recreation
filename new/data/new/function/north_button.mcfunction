# north_button.mcfunction （动态速度终极版）

# 按下按钮并永远保持按下状态（活塞永久伸出）
execute as @e[tag=piston,tag=north] at @s run setblock ~ ~ ~1 minecraft:stone_button[facing=south,powered=true] replace

# ============ 动态延迟启动 north_step ============
# 读取最近玩家的 speed 值（@p），如果超出范围则强制限制在 2~20
execute as @p run scoreboard players operation #temp speed = @s speed
execute as @p unless score @s speed matches 2..20 run scoreboard players set #temp speed 4
execute if score #temp speed matches ..1 run scoreboard players set #temp speed 2
execute if score #temp speed matches 21.. run scoreboard players set #temp speed 20

# 创建一个临时计分板用于生成 schedule 命令
scoreboard objectives add temp_schedule dummy
scoreboard players set #delay temp_schedule 0

# 通过 operation 生成正确的延迟（把 #temp 复制进去）
scoreboard players operation #delay temp_schedule = #temp speed

# 使用 schedule 的动态延迟（1.20.2+ 完全支持）
# 格式：schedule function path delay append
execute if score #delay temp_schedule matches 2 run schedule function new:north_step 2t append
execute if score #delay temp_schedule matches 3 run schedule function new:north_step 3t append
execute if score #delay temp_schedule matches 4 run schedule function new:north_step 4t append
execute if score #delay temp_schedule matches 5 run schedule function new:north_step 5t append
execute if score #delay temp_schedule matches 6 run schedule function new:north_step 6t append
execute if score #delay temp_schedule matches 7 run schedule function new:north_step 7t append
execute if score #delay temp_schedule matches 8 run schedule function new:north_step 8t append
execute if score #delay temp_schedule matches 9 run schedule function new:north_step 9t append
execute if score #delay temp_schedule matches 10 run schedule function new:north_step 10t append
execute if score #delay temp_schedule matches 11 run schedule function new:north_step 11t append
execute if score #delay temp_schedule matches 12 run schedule function new:north_step 12t append
execute if score #delay temp_schedule matches 13 run schedule function new:north_step 13t append
execute if score #delay temp_schedule matches 14 run schedule function new:north_step 14t append
execute if score #delay temp_schedule matches 15 run schedule function new:north_step 15t append
execute if score #delay temp_schedule matches 16 run schedule function new:north_step 16t append
execute if score #delay temp_schedule matches 17 run schedule function new:north_step 17t append
execute if score #delay temp_schedule matches 18 run schedule function new:north_step 18t append
execute if score #delay temp_schedule matches 19 run schedule function new:north_step 19t append
execute if score #delay temp_schedule matches 20 run schedule function new:north_step 20t append

# 清理临时计分板（可选，但推荐）
scoreboard objectives remove temp_schedule