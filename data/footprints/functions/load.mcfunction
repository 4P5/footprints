## Add the objectives.
# Movement checks.
scoreboard objectives add 4p5.ftprnt.walk minecraft.custom:walk_one_cm
scoreboard objectives add 4p5.ftprnt.sprint minecraft.custom:sprint_one_cm
scoreboard objectives add 4p5.ftprnt.jump minecraft.custom:minecraft.jump

# Remove/decay timer for fancy footprint removal.
scoreboard objectives add 4p5.ftprnt.rem dummy

# Config.
scoreboard objectives add 4p5.ftprnt.cfg dummy

# Temporary (intra-tick) operations.
scoreboard objectives add 4p5.ftprnt.temp dummy

# Run the config function, which sets values.
function footprints:config

# Modify timeouts to fit the config.
scoreboard players operation $CONFIG_KILL 4p5.ftprnt.cfg = $CONFIG_DURATION 4p5.ftprnt.cfg
scoreboard players add $CONFIG_KILL 4p5.ftprnt.cfg 10

