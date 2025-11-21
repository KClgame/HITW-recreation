# random:roll_side.mcfunction （一次性随机生成方向，不循环、不提示、不状态限制）

execute store result score @p side run random value 1..4

execute store result score @p player_random run random value 1..9

execute if score @p side matches 1 run function random:random_walls_north
execute if score @p side matches 2 run function random:random_walls_east
execute if score @p side matches 3 run function random:random_walls_south
execute if score @p side matches 4 run function random:random_walls_west
#execute if score @p side matches 5.. run function random:random_walls_north

