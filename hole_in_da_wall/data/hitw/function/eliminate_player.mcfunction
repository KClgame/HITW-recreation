# hitw:eliminate_player.mcfunction （被淘汰的玩家是 @s）

title @p times 0t 60t 0t
title @p title {"text":"You are eliminated!","color":"red","bold":true}

tp @p -12 1 -4
playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 2 0.8
playsound minecraft:entity.lightning_bolt.thunder master @s ~ ~ ~ 2 1

kill @e[tag=piston,tag=north]
schedule clear hitw:north_step
schedule clear hitw:north_button
schedule clear hitw:kill_north_pistons

scoreboard players set @a random_on 0

fill 7 5 -15 -7 1 8 air replace

tag @p remove in_game

schedule function hitw:final_score 60t append