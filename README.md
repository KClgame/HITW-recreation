Hello KCl there

this is the datapack for Hole In The Wall recreation

You can build your own wall,modify the wall speed and count how many walls you've survived!

to disable the celebration animation
change the file name "big_celebration.mcfunction" to "big_celebration.mcfunction1" 
or just open the file and edit it yourself!

use /scoreboard players set @s speed [number] to modify the wall speed,range is 2-20.

to start the game,find the command block on the left,and click the stone button or just type /function start:start_game

to end the game,,find the command block on the left,and click the stone button or just type /function new:eliminate_player

If u make more walls,plz name them wallsx (x started from current max wall number+1,and open random_walls.mcfunction,edit the upper limit of
execute store result score @p player_random run random roll 1..9
the "9" is the upper limit,change it to ur max wall number to avoid empty wall(which will stop the game)

ongoing todo list
Gradient speed
four sides hitw game
more walls presets

