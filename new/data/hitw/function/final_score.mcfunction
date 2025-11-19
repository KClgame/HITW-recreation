# hitw:final_score.mcfunction

execute store result storage temp:eliminate walls int 1 run scoreboard players get @p survived_walls

title @a title {"text":""}

tellraw @a [{"text":"","color":"gold"},{"text":"╔══════════════════════════════╗","bold":true}]
tellraw @a [{"text":"                         ELIMINATED","color":"red","bold":true}]
tellraw @a [{"text":"                         You survived ","color":"yellow"},{"score":{"name":"@p","objective":"survived_walls"},"color":"gold","bold":true},{"text":" walls!","color":"yellow"}]
tellraw @a [{"text":"╚══════════════════════════════╝","color":"gold","bold":true}]

playsound minecraft:entity.player.levelup master @a ~ ~ ~ 2 0.8
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2 1
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 0.8

scoreboard players set @p survived_walls 0
scoreboard players set @p temp_20 0

tellraw @a [{"text":"[结算] ","color":"dark_red","bold":true},{"selector":"@p"},{"text":" 的存活墙数已归零，可重新开始挑战！","color":"gray"}]