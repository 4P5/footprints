# Note: I'm using `if predicate footprints:on_ground` as it's much more efficent than `if entity @s[nbt={OnGround:1b}]`—from testing, 1450ms versus 90ms for 32k commands.
execute if score @s 4p5.ftprnt.walk >= $CONFIG_DISTANCE 4p5.ftprnt.cfg at @s if predicate footprints:on_ground run function footprints:walk
execute if score @s 4p5.ftprnt.sprint >= $CONFIG_DISTANCE 4p5.ftprnt.cfg at @s if predicate footprints:on_ground run function footprints:walk

# -0.12130 is the exact amount to account for the offset that the predicate applies (it triggers slightly before the player is actually on the ground).
# I can't account for all heights, so this just accounts for a single block (i.e., jumping and landing on the same block when sprint jumping).
execute if score @s 4p5.ftprnt.jump matches 1.. at @s if predicate footprints:on_ground positioned ~ ~-0.12130 ~ run function footprints:walk