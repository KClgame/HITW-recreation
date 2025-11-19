# new:check_eliminate.mcfunction （精准每tick检测所有玩家掉落）

# 检测所有玩家，只要任意一人 Y ≤ -3 就立即淘汰
execute as @a[y=-3,dy=-3] at @a run function new:eliminate_player