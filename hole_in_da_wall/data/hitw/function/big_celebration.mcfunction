# hitw:big_celebration.mcfunction （单个文件终极版）

execute as @a at @s run particle minecraft:end_rod ~ ~2 ~ 4 5 4 0.2 1000 force
execute as @a at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0 0 0 2 400 force
execute as @a at @s run particle minecraft:electric_spark ~ ~2 ~ 5 4 5 0.4 800 force
execute as @a at @s run particle minecraft:firework ~ ~1 ~ 0 0 0 1.5 500 force

schedule function hitw:temp_wave2 8t append
schedule function hitw:temp_wave3 16t append

playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 4 0.8
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 3 1.2
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 4 1
playsound minecraft:entity.firework_rocket.twinkle master @a ~ ~ ~ 4 1.5
playsound minecraft:block.beacon.power_select master @a ~ ~ ~ 4 2

tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @a [{"text":"    YOU HAVE SURVIVED ","color":"yellow","bold":true},{"score":{"name":"KCl__","objective":"survived_walls"},"color":"gold","bold":true},{"text":" WALLS!","color":"yellow","bold":true}]
tellraw @a [{"text":"       奇迹！又一次超越极限！","color":"light_purple","bold":true,"italic":true}]
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

execute as @a at @s run particle minecraft:firework ~ ~2 ~ 0 0 0 1.8 600 force
playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 4 0.9

execute as @a at @s run particle minecraft:firework ~ ~3 ~ 0 0 0 2 800 force
playsound minecraft:entity.firework_rocket.large_blast master @a ~ ~ ~ 4 0.8