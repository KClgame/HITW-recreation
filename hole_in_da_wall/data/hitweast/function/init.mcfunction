kill @e[type=minecraft:armor_stand,tag=piston]

fill -14 11 2 -14 15 -11 minecraft:sticky_piston[facing=east] replace minecraft:sticky_piston

function hitweast:summon_east

scoreboard players set @e[tag=piston] loop_count 0

function hitweast:east_button