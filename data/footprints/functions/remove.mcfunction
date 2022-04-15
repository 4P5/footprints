## Remove footprints. Triggered when there's more than the config.
# Note that the default sort (i.e., none specified) filtered with "limit=1" selects the oldest entity matching the criteria, which is perfect for this use case.
# Also note that `$FOOTPRINT_COUNT` is just the number of *additional* footprints to remove, so this amount of footprints will be removed eventually regardless.

# The first line activates if we're more than 64 footprints over the limit. This is the highest I'll go to balance between performance and accuracy. At thousands of footprints per second this would be too slow, but at that point you should really be using a plugin or mod.
# It stores the remaining number of footprints to remove in `$FOOTPRINT_COUNT`, then halves the next check. This continues until at most 127 footprints have been removed.
scoreboard players set $TEMP_SUCCESS 4p5.ftprnt.temp 0
execute store success score $TEMP_SUCCESS 4p5.ftprnt.temp if score $FOOTPRINT_COUNT 4p5.ftprnt.temp matches 64.. run tag @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=64] add 4p5.ftprnt.temprem
execute unless score $TEMP_SUCCESS 4p5.ftprnt.temp matches 1 store success score $TEMP_SUCCESS 4p5.ftprnt.temp if score $FOOTPRINT_COUNT 4p5.ftprnt.temp matches 32.. run tag @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=32] add 4p5.ftprnt.temprem
execute unless score $TEMP_SUCCESS 4p5.ftprnt.temp matches 1 store success score $TEMP_SUCCESS 4p5.ftprnt.temp if score $FOOTPRINT_COUNT 4p5.ftprnt.temp matches 16.. run tag @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=16] add 4p5.ftprnt.temprem
execute unless score $TEMP_SUCCESS 4p5.ftprnt.temp matches 1 store success score $TEMP_SUCCESS 4p5.ftprnt.temp if score $FOOTPRINT_COUNT 4p5.ftprnt.temp matches 8.. run tag @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=8] add 4p5.ftprnt.temprem
execute unless score $TEMP_SUCCESS 4p5.ftprnt.temp matches 1 store success score $TEMP_SUCCESS 4p5.ftprnt.temp if score $FOOTPRINT_COUNT 4p5.ftprnt.temp matches 4.. run tag @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=4] add 4p5.ftprnt.temprem
execute unless score $TEMP_SUCCESS 4p5.ftprnt.temp matches 1 store success score $TEMP_SUCCESS 4p5.ftprnt.temp if score $FOOTPRINT_COUNT 4p5.ftprnt.temp matches 2.. run tag @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=2] add 4p5.ftprnt.temprem
execute unless score $TEMP_SUCCESS 4p5.ftprnt.temp matches 1 store success score $TEMP_SUCCESS 4p5.ftprnt.temp if score $FOOTPRINT_COUNT 4p5.ftprnt.temp matches 1 run tag @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=1] add 4p5.ftprnt.temprem

# Add the "dying" tag to signal that these footprints are in the process of decaying, and should not be considered for additional checks.
tag @e[type=armor_stand,tag=4p5.ftprnt.temprem] add 4p5.ftprnt.dying

# Set the timer so the footprints begin their decaying animation early.
scoreboard players operation @e[type=armor_stand,tag=4p5.ftprnt.temprem] 4p5.ftprnt.rem = $CONFIG_DURATION 4p5.ftprnt.cfg

# Remove the temporary tag from the entities. It's faster to do it globally (for all entities) as it takes a check less.
tag @e remove 4p5.ftprnt.temprem

