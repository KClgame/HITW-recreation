# 强制从世界中心（0 0 0）执行检测，彻底摆脱执行位置继承问题
execute positioned 0 0 0 as @a[tag=in_game,y=-3,dy=-100] at @s run function hitw:eliminate_player

# 或者用 run execute positioned（同等效果）
execute positioned 0 0 0 run execute as @a[tag=in_game,y=-3,dy=-100] at @s run function hitw:eliminate_player

# 循环（replace 保持不变）
schedule function hitw:check_eliminate 5t replace
