# If the time specified in the config has elapsed, decay or remove the footprint.
execute if score @s 4p5.ftprnt.rem = $CONFIG_DURATION 4p5.ftprnt.cfg run data modify entity @s Pose.RightArm set value [0.5f,0f,179.5f]
execute if score @s 4p5.ftprnt.rem >= $CONFIG_DURATION 4p5.ftprnt.cfg at @s run tp @s ~ ~-0.001 ~
execute if score @s 4p5.ftprnt.rem >= $CONFIG_KILL 4p5.ftprnt.cfg run kill @s

# Remove footprints if their blocks have been broken.
execute at @s positioned ~ ~0.97826 ~ if block ~ ~ ~ air run kill @s