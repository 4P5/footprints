# Set an individual footprint to the maximum config duration, to begin the decay. Don't select ones we've already processed.
# Note that the default sort (i.e., none specified) filtered with "limit=1" selects the oldest entity matching the criteria, which is perfect for this use case.
scoreboard players operation @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=1] 4p5.ftprnt.rem = $CONFIG_DURATION 4p5.ftprnt.cfg

# Add the "dying" tag to signal that this footprint is in the process of decaying, and should not be considered.
tag @e[type=armor_stand,tag=4p5.ftprnt.print,tag=!4p5.ftprnt.dying,limit=1] add 4p5.ftprnt.dying

# To avoid re-counting the footprints and removing ones that have already decayed, assume 1 has already been removed.
scoreboard players remove $FOOTPRINT_COUNT 4p5.ftprnt.temp 1

# If there are more footprints than either of the limits, run this function again. This will be recursively called until all footprints are gone.
# If there's more than both limits, this will be run twice, which is fine.
# Note that the parent function has already calculated many of the limits, so we don't need to do that again.
execute if score $FOOTPRINT_COUNT 4p5.ftprnt.temp >= $FOOTPRINT_LIMIT 4p5.ftprnt.temp run function footprints:remove

