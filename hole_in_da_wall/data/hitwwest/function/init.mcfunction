kill @e[type=minecraft:armor_stand,tag=piston]

fill 15 15 2 15 11 -11 minecraft:sticky_piston[facing=west] replace minecraft:sticky_piston
# 注意：facing=west → 墙从东向西推（玩家在东侧）

function hitwwest:summon_west

scoreboard players set @e[tag=piston] loop_count 0

function hitwwest:west_button