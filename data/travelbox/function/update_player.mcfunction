# =========================================================
# TRAVEL BOX ENCUMBRANCE
# =========================================================

# Always remove the old modifier first.
# This ensures disabling encumbrance immediately restores
# the player's normal movement speed.
attribute @s minecraft:movement_speed modifier remove travelbox:encumbrance


# Reset Travel Box count.
scoreboard players set @s travel_boxes 0


# =========================================================
# COUNT TRAVEL BOXES
# Only necessary when encumbrance is enabled.
# =========================================================

# LEGACY: ALL travel boxes, empty or full, apply encumbrance. Now, its only if they have items in them.
# execute if score #encumbrance_enabled travelbox_config matches 1 store result score @s travel_boxes run clear @s minecraft:brown_shulker_box[minecraft:custom_data~{travel_box:true}] 0

# NEW: Encumbrance only applied if there are items in it
execute if score #encumbrance_enabled travelbox_config matches 1 store result score @s travel_boxes run clear @s minecraft:brown_shulker_box[minecraft:custom_data~{travel_box:true},minecraft:container~{items:{size:{min:1}}}] 0

# =========================================================
# APPLY ENCUMBRANCE
#
# 0-1 boxes = 100%
# 2 boxes   = 95%
# 3 boxes   = 90%
# 4 boxes   = 85%
# 5 boxes   = 75%
# 6 boxes   = 65%
# 7 boxes   = 55%
# 8+ boxes  = 45%
# =========================================================

execute if score #encumbrance_enabled travelbox_config matches 1 if score @s travel_boxes matches 2 run attribute @s minecraft:movement_speed modifier add travelbox:encumbrance -0.05 add_multiplied_base

execute if score #encumbrance_enabled travelbox_config matches 1 if score @s travel_boxes matches 3 run attribute @s minecraft:movement_speed modifier add travelbox:encumbrance -0.10 add_multiplied_base

execute if score #encumbrance_enabled travelbox_config matches 1 if score @s travel_boxes matches 4 run attribute @s minecraft:movement_speed modifier add travelbox:encumbrance -0.15 add_multiplied_base

execute if score #encumbrance_enabled travelbox_config matches 1 if score @s travel_boxes matches 5 run attribute @s minecraft:movement_speed modifier add travelbox:encumbrance -0.25 add_multiplied_base

execute if score #encumbrance_enabled travelbox_config matches 1 if score @s travel_boxes matches 6 run attribute @s minecraft:movement_speed modifier add travelbox:encumbrance -0.35 add_multiplied_base

execute if score #encumbrance_enabled travelbox_config matches 1 if score @s travel_boxes matches 7 run attribute @s minecraft:movement_speed modifier add travelbox:encumbrance -0.45 add_multiplied_base

execute if score #encumbrance_enabled travelbox_config matches 1 if score @s travel_boxes matches 8.. run attribute @s minecraft:movement_speed modifier add travelbox:encumbrance -0.55 add_multiplied_base