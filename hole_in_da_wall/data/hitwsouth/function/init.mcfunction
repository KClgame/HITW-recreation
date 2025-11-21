kill @e[type=minecraft:armor_stand,tag=piston]

fill 7 15 -19 -6 11 -19 minecraft:sticky_piston[facing=south] replace minecraft:sticky_piston

function hitwsouth:summon_south

scoreboard players set @e[tag=piston] loop_count 0

function hitwsouth:south_button