# ===== 速度系统 =====
scoreboard objectives add speed dummy {"text":"墙速","color":"aqua"}

# 给所有玩家默认速度 4t（原版）
execute as @a unless score @s speed matches 2..20 run scoreboard players set @s speed 4

# 提示玩家如何改速度
tellraw @a [{"text":"[Walls Survived] ","color":"gold","bold":true},{"text":"速度已就绪！用 ","color":"green"},{"text":"/scoreboard players set @s speed 数值","color":"yellow","bold":true,"underlined":true},{"text":" 修改墙速（2~20）","color":"green"}]

# 创建两个计分项
scoreboard objectives add survived_walls dummy {"text":"Walls Survived","bold":true,"color":"gold"}
scoreboard objectives add temp_20 dummy
scoreboard objectives add loop_count dummy

# 侧边栏只显示 survived_walls（会自动显示当前观看侧边栏的每个玩家的个人分数）
scoreboard objectives setdisplay sidebar survived_walls

# 【重要】给所有可能进入世界的玩家初始化分数为0（防止第一次进服不显示）
# 这样即使换人玩，侧边栏也会立刻出现 0
execute as @a run scoreboard players add @s survived_walls 0
execute as @a run scoreboard players add @s temp_20 0

# 自动检测墙体是否存在，不存在就自动初始化（保留你原来的检测逻辑）
function new:detect_north_wall

# （可选）加载完成提示
tellraw @a [{"text":"[Walls Survived] ","color":"gold","bold":true},{"text":"数据包加载成功！侧边栏已绑定到每个玩家个人分数","color":"green"}]
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 1.5

# ===== 随机墙系统 =====
scoreboard objectives add player_random dummy {"text":"随机墙种子","color":"light_purple"}

# 给所有玩家初始化随机种子（防止不显示）
execute as @a run scoreboard players add @s player_random 0

tellraw @a [{"text":"[Walls Survived] ","color":"gold","bold":true},{"text":"随机墙系统已启用！每面墙结束后将自动生成随机墙体（1~9）","color":"aqua"}]

# ===== 随机墙个人开关系统（玩家绑定版）=====
scoreboard objectives add random_on dummy {"text":"随机墙开关","color":"light_purple"}

# 给所有玩家默认开启（1=开，0=关）
execute as @a unless score @s random_on matches 0..1 run scoreboard players set @s random_on 1

tellraw @a [{"text":"[随机墙开关] ","color":"light_purple","bold":true},{"text":"个人随机墙已就绪！当前状态："},{"score":{"name":"@s","objective":"random_on"},"color":"gold","bold":true},{"text":" (1=启用 0=禁用)\n个人切换 → ","color":"gray"},{"text":"/scoreboard players set @s random_on 0/1","color":"yellow","bold":true,"underlined":true,"clickEvent":{"action":"suggest_command","value":"/scoreboard players set @s random_on "}}]

# 启动每tick检测（放在load最后）
schedule function new:tick 1t replace