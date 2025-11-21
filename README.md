Hello KCl there

this is the datapack for Hole In The Wall recreation

You can build your own wall and platform,modify the wall speed and count how many walls you've survived!

when join,click aqua"clear" and lime"load1" and red"load2"

I added wall return system,celebration system,wall making and saving system,platform making and saving system,wall counting system,speed modifying system

to disable the celebration animation change the file name "final/big_celebration.mcfunction" to "big_celebration.mcfunction1" or just open the file and edit it yourself!

use /scoreboard players set @s speed [number] to modify the wall speed,range is 2-20.

to start the game,find the command block with orange"start",and click the stone button or just type /function start:start_game

to pause the game,find the command block with yellow"pause",and click the stone button  or just type /execute as @p run scoreboard players set @s random_on 0

to end the game,just jump off with eliminate on and "in_game" tag or type /function final:eliminate_player


If u make more walls,plz name them wallsx (x started from current max wall number+1,and open random_walls.mcfunction,edit the upper limit of execute store result score @p player_random run random roll 1..9 the "9" is the upper limit,change it to ur max wall number to avoid empty wall(which will stop the game)

ongoing todo list 
traps
