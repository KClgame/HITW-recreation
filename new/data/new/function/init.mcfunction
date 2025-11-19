kill @e[type=minecraft:armor_stand,tag=piston]

fill 7 1 9 -7 5 9 minecraft:sticky_piston[facing=north] replace minecraft:sticky_piston

function new:summon_north

scoreboard players set @e[tag=piston] loop_count 0

function new:north_button
