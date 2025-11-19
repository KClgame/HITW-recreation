# ===== 速度系统 =====
scoreboard objectives add speed dummy {"text":"墙速","color":"aqua"}
execute as @a unless score @s speed matches 2..20 run scoreboard players set @s speed 4
tellraw @a [{"text":"[Walls Survived] ","color":"gold","bold":true},{"text":"速度已就绪！用 ","color":"green"},{"text":"/scoreboard players set @s speed 数值","color":"yellow","bold":true,"underlined":true},{"text":" 修改墙速（2~20）","color":"green"}]

scoreboard objectives add survived_walls dummy {"text":"Walls Survived","bold":true,"color":"gold"}
scoreboard objectives add temp_20 dummy
scoreboard objectives add loop_count dummy
scoreboard objectives setdisplay sidebar survived_walls

execute as @a run scoreboard players add @s survived_walls 0
execute as @a run scoreboard players add @s temp_20 0

function hitw:detect_north_wall

tellraw @a [{"text":"[Walls Survived] ","color":"gold","bold":true},{"text":"数据包加载成功！侧边栏已绑定到每个玩家个人分数","color":"green"}]
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 1.5

scoreboard objectives add player_random dummy {"text":"随机墙种子","color":"light_purple"}
execute as @a run scoreboard players add @s player_random 0
tellraw @a [{"text":"[Walls Survived] ","color":"gold","bold":true},{"text":"随机墙系统已启用！每面墙结束后将自动生成随机墙体（1~9）","color":"aqua"}]

scoreboard objectives add random_on dummy {"text":"随机墙开关","color":"light_purple"}
execute as @a unless score @s random_on matches 0..1 run scoreboard players set @s random_on 1
tellraw @a [{"text":"[随机墙开关] ","color":"light_purple","bold":true},{"text":"个人随机墙已就绪！当前状态："},{"score":{"name":"@s","objective":"random_on"},"color":"gold","bold":true},{"text":" (1=启用 0=禁用)\n个人切换 → ","color":"gray"},{"text":"/scoreboard players set @s random_on 0/1","color":"yellow","bold":true,"underlined":true,"clickEvent":{"action":"suggest_command","value":"/scoreboard players set @s random_on "}}]

schedule function hitw:tick 1t replace