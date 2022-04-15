## Runs after either `step_left` or `step_right`.

# Remove the footprint if it's not fully inside a block (i.e., if there's air on any side). The first check is also performed each tick, but the rest aren't for the sake of performance.
execute as @e[tag=4p5.ftprnt.temp,type=armor_stand] at @s positioned ~ ~0.97826 ~ run function footprints:overhang_check

# Remove the temporary tag.
tag @e remove 4p5.ftprnt.temp
