# Remove the footprint if it's not fully inside a block (i.e., if there's air on any side). The first check is also performed each tick, but the rest aren't for the sake of performance.
execute if block ~ ~ ~ air run kill @s
execute if block ~ ~ ~.40 air run kill @s
execute if block ~ ~ ~-.40 air run kill @s
execute if block ~.40 ~ ~ air run kill @s
execute if block ~-.40 ~ ~ air run kill @s

