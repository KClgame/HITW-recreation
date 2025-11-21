kill @e[type=minecraft:armor_stand,tag=piston]

fill -6 15 10 7 11 10 minecraft:sticky_piston[facing=north] replace minecraft:sticky_piston

function hitwnorth:summon_north

scoreboard players set @e[tag=piston] loop_count 0

function hitwnorth:north_button