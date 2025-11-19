# new:tick.mcfunction （每tick运行一次

# 只有游戏进行中（有活塞在动）才检测淘汰
execute if entity @e[tag=piston,tag=north,limit=1] run function new:check_eliminate