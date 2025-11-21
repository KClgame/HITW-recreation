# south_button.mcfunction （动态速度终极版）

execute as @e[tag=piston,tag=south] at @s run setblock ~ ~ ~-1 minecraft:stone_button[facing=north,powered=true] replace
# 注意：按钮放在活塞前面一格，朝北（玩家方向）

execute as @p run scoreboard players operation #temp speed = @s speed
execute as @p unless score @s speed matches 2..20 run scoreboard players set #temp speed 4
execute if score #temp speed matches ..1 run scoreboard players set #temp speed 2
execute if score #temp speed matches 21.. run scoreboard players set #temp speed 20

scoreboard objectives add temp_schedule dummy
scoreboard players set #delay temp_schedule 0
scoreboard players operation #delay temp_schedule = #temp speed

execute if score #delay temp_schedule matches 2 run schedule function hitwsouth:south_step 2t append
execute if score #delay temp_schedule matches 3 run schedule function hitwsouth:south_step 3t append
execute if score #delay temp_schedule matches 4 run schedule function hitwsouth:south_step 4t append
execute if score #delay temp_schedule matches 5 run schedule function hitwsouth:south_step 5t append
execute if score #delay temp_schedule matches 6 run schedule function hitwsouth:south_step 6t append
execute if score #delay temp_schedule matches 7 run schedule function hitwsouth:south_step 7t append
execute if score #delay temp_schedule matches 8 run schedule function hitwsouth:south_step 8t append
execute if score #delay temp_schedule matches 9 run schedule function hitwsouth:south_step 9t append
execute if score #delay temp_schedule matches 10 run schedule function hitwsouth:south_step 10t append
execute if score #delay temp_schedule matches 11 run schedule function hitwsouth:south_step 11t append
execute if score #delay temp_schedule matches 12 run schedule function hitwsouth:south_step 12t append
execute if score #delay temp_schedule matches 13 run schedule function hitwsouth:south_step 13t append
execute if score #delay temp_schedule matches 14 run schedule function hitwsouth:south_step 14t append
execute if score #delay temp_schedule matches 15 run schedule function hitwsouth:south_step 15t append
execute if score #delay temp_schedule matches 16 run schedule function hitwsouth:south_step 16t append
execute if score #delay temp_schedule matches 17 run schedule function hitwsouth:south_step 17t append
execute if score #delay temp_schedule matches 18 run schedule function hitwsouth:south_step 18t append
execute if score #delay temp_schedule matches 19 run schedule function hitwsouth:south_step 19t append
execute if score #delay temp_schedule matches 20 run schedule function hitwsouth:south_step 20t append

scoreboard objectives remove temp_schedule