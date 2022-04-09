## This function triggers as a player, at their location, and after they have walked or sprinted a configurable distance in centimeters.

# Reset the walk scores
scoreboard players set @s 4p5.ftprnt.walk 0
scoreboard players set @s 4p5.ftprnt.sprint 0
scoreboard players set @s 4p5.ftprnt.jump 0

######################################
## Make sure we're not exceeding the footprint soft limits set in the config by doing some maths.
# Count players into temporary variable.
execute store result score $PLAYER_COUNT 4p5.ftprnt.temp if entity @a
# Set other temporary variable to the config.
scoreboard players operation $FOOTPRINT_LIMIT 4p5.ftprnt.temp = $MAX_PER_PLAYER 4p5.ftprnt.cfg
# Multiply the config's value by the number of online players.
scoreboard players operation $FOOTPRINT_LIMIT 4p5.ftprnt.temp *= $PLAYER_COUNT 4p5.ftprnt.temp
# Count the number of footprints.
execute store result score $FOOTPRINT_COUNT 4p5.ftprnt.temp if entity @e[type=minecraft:armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying]
# If there are more footprints than the player limit, recursively remove the oldest.
execute if score $FOOTPRINT_COUNT 4p5.ftprnt.temp >= $FOOTPRINT_LIMIT 4p5.ftprnt.temp run function footprints:remove

## Now check for the "hard limit", which will forcibly remove all footprints regardless of status or age. This is ugly, which is why the soft limit is preferred.
# Check again, but include decaying footprints.
execute store result score $FOOTPRINT_COUNT 4p5.ftprnt.temp if entity @e[type=minecraft:armor_stand,tag=4p5.ftprnt.print]
# If we've exceeded the global hard limit, forcibly kill all footprints.
execute if score $FOOTPRINT_COUNT 4p5.ftprnt.temp >= $MAX_GLOBAL 4p5.ftprnt.cfg run kill @e[type=armor_stand,tag=4p5.ftprnt.print]
######################################

# Run the generic function, which summons the armour stand. The name is a leftover from when it did more things than just that.
# Specifically, I was trying to develop an ultra-precise system for determining the height of the footprint and preventing overlap.
# It'd summon around 20 small armor stands with slight offsets around the area, then after giving them some time to fall, pick the lowest one nearest to the center.
# This would ensure the footprint would be as low as possible, which is typically what you'd want for a block (far less overhangs). I scrapped the feature later in development for performance reasons.
function footprints:step_generic

# Alternate between left and right footprints, using a temporary objective to ensure only one of the functions runs. We'll set the height of the current block with this offset in mind.
execute unless entity @s[tag=4p5.ftprnt.alt] positioned ^.3 ^ ^ run function footprints:step_height
execute if entity @s[tag=4p5.ftprnt.alt] positioned ^-.3 ^ ^ run function footprints:step_height

# Toggle the tag between on and off to use the other foot for the next print.
execute store success score @s 4p5.ftprnt.temp run tag @s remove 4p5.ftprnt.alt
execute if score @s 4p5.ftprnt.temp matches 0 run tag @s add 4p5.ftprnt.alt

# Perform cleanup and ensure the footprint is not inside air.
function footprints:step_after