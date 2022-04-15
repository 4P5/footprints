
## Make sure we're not exceeding the footprint soft limits set in the config by doing some maths.
# Count players into temporary variable.
execute store result score $PLAYER_COUNT 4p5.ftprnt.temp if entity @a
# Set other temporary variable to the config.
scoreboard players operation $FOOTPRINT_LIMIT 4p5.ftprnt.temp = $MAX_PER_PLAYER 4p5.ftprnt.cfg
# Multiply the config's value by the number of online players.
scoreboard players operation $FOOTPRINT_LIMIT 4p5.ftprnt.temp *= $PLAYER_COUNT 4p5.ftprnt.temp
# Count the number of footprints, excluding ones that are already in the process of decay.
execute store result score $FOOTPRINT_COUNT 4p5.ftprnt.temp if entity @e[type=minecraft:armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying]
# Subtract the limit from the temporary variable for later use.
scoreboard players operation $FOOTPRINT_COUNT 4p5.ftprnt.temp -= $FOOTPRINT_LIMIT 4p5.ftprnt.temp
# If there are more footprints than the player limit (i.e., if it's over 1), remove the oldest.
execute if score $FOOTPRINT_COUNT 4p5.ftprnt.temp matches 1.. run function footprints:remove

## Now check for the "hard limit", which will forcibly remove all footprints regardless of status or age. This is ugly, which is why the soft limit is preferred.
# Check again, but include decaying footprints (as it's a hard limit/emergence scenario).
execute store result score $FOOTPRINT_COUNT 4p5.ftprnt.temp if entity @e[type=minecraft:armor_stand,tag=4p5.ftprnt.print]
# If we've exceeded the global hard limit, forcibly kill all footprints.
execute if score $FOOTPRINT_COUNT 4p5.ftprnt.temp >= $MAX_GLOBAL 4p5.ftprnt.cfg run kill @e[type=armor_stand,tag=4p5.ftprnt.print]
