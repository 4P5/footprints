# Default height
tp @e[tag=4p5.ftprnt.temp] ~ ~-0.97827 ~ ~ ~

execute if score $CONFIG_MODE 4p5.ftprnt.cfg matches 1 run loot replace entity @e[tag=4p5.ftprnt.temp,type=armor_stand] weapon mine ~ ~-.1 ~
execute if score $CONFIG_MODE 4p5.ftprnt.cfg matches 1 run data modify entity @e[tag=4p5.ftprnt.temp,type=armor_stand,limit=1] Pose.RightArm set value [-15f,0f,180f]
execute if score $CONFIG_MODE 4p5.ftprnt.cfg matches 1 run tp @e[tag=4p5.ftprnt.temp,type=armor_stand] ~ ~-1.04759 ~