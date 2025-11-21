# hitwnorth:eliminate_player.mcfunction （被淘汰的玩家是 @s）

title @p times 0t 60t 0t
title @p title {"text":"You are eliminated!","color":"red","bold":true}

tp @p 1 24 -4
playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 2 0.8
playsound minecraft:entity.lightning_bolt.thunder master @s ~ ~ ~ 2 1

kill @e[tag=piston]
schedule clear hitwnorth:north_step
schedule clear hitwnorth:north_button
schedule clear hitwnorth:kill_north_pistons

scoreboard players set @a random_on 0

fill -14 11 2 -6 16 -11 air
fill -6 16 -11 7 11 -19 air
fill 15 11 -11 7 16 2 air
fill 7 16 2 -6 11 10 air
fill -6 16 2 7 11 -11 air

#fill -14 11 -19 15 15 10 air replace

tag @p remove in_game

execute as @p run schedule function final:final_score 60t append