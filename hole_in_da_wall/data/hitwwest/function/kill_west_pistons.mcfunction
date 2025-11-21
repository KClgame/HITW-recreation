scoreboard players set @e[tag=piston] loop_count 0

kill @e[tag=piston,tag=west]

execute if score @p random_on matches 1 run function random:random_walls
execute if score @p random_on matches 0 run function random:stop_new_wall