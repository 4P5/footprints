# If the player has walked or sprinted 100 centimeters, or has jumped, run the `walk` function.
execute as @a if predicate footprints:on_ground run function footprints:movement_check

# If the time specified in the config has elapsed, decay or remove the footprint. Also remove the footprint if its block is absent.
execute as @e[type=armor_stand,tag=4p5.ftprnt.print] run function footprints:time_check

# Add to the per-footprint timer.
scoreboard players add @e[type=minecraft:armor_stand,tag=4p5.ftprnt.print] 4p5.ftprnt.rem 1