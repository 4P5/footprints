####################################################################################################################
## Configure the datapack here!
####################################################################################################################

####################################################################################################################
## How many ticks (1 second = 20 ticks) should the footprint stay before decaying? Default is 300 ticks (15 seconds).
## They're not very laggy, but may look ugly if there's too many in one place. Decay always takes a set time on top of this.
scoreboard players set $CONFIG_DURATION 4p5.ftprnt.cfg 300
###################################################### ^^^^^ #######################################################

####################################################################################################################
## How many centimeters should the player walk to create a footprint?
## 160 is the default, since that's the rough time between the footstep sounds.
## Visually, however, there's a rather large gap. If you prefer smaller gaps, you can set this to something like 80.
scoreboard players set $CONFIG_DISTANCE 4p5.ftprnt.cfg 80
###################################################### ^^^ #########################################################

####################################################################################################################
## Footprint limits. This will prematurely set footprints to decay if there are more than (PlayerCount * Limit) footprints.
## For large servers, consider setting per-player lower as most players won't be generating their full quota all the time.
## 1000 is a very generous limit; from testing it took around 10 mspt and a decent chunk of my framerate (spawning 1000 in once place).
## Note that the hard (global) limit will immediately kill all footprints (ugly), while the per-player limit will just set them to decay.
scoreboard players set $MAX_PER_PLAYER 4p5.ftprnt.cfg 50
##                                                    ^^^
scoreboard players set $MAX_GLOBAL 4p5.ftprnt.cfg 1000
################################################# ^^^^ #############################################################

####################################################################################################################
## Set to `1` to enable the experimental block-based footprint mode, and `0` or any other number to disable it (default).
## This replaces the grey tint with the result of mining the block it rests on, which could look better or worse.
scoreboard players set $CONFIG_MODE 4p5.ftprnt.cfg 0
################################################## ^ ###############################################################

####################################################################################################################
## INFO:
##          Created by 4P5 (https://www.youtube.com/4P5mc)
## 
## STRUCTURE:
##          Ticking function is `tick`, running `movement_check` and `time_check`.
##          `walk` is conditional, and runs `step_*`, and `remove` conditionally.
##          `step_after` runs `overhang_check`.
##          `load` runs `config`.
##                                                                                                               
##                                            tick                                          load             
##                                          / /    \                                         |                                  
##                          _______________/ /      \                                        |
##                         /                /        \                                     config                                             
##              limit_check(c)  movement_check     walk(c)                                    
##                    |            time_check         |                                                                              
##                    |                               |   
##                remove(c)                      step_generic                                                                            
##                                               step_height                                                                                           
##                                                step_after                                                                                
##                                                    |
##                                                    |
##                                              overhang_check                                                                                          
##                                                                                                                          
####################################################################################################################