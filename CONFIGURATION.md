# Travel Box configuration

Travel Box configuration is controlled by the global scoreboard objective `travelbox_config`. The active flag is stored in the fake-player `#encumbrance_enabled`, so the setting applies to every player in the world.

## Public commands

Run these as an operator or from the server console:

```text
/function travelbox:encumbrance_enable
```

Enables global encumbrance. When enabled, the datapack applies movement penalties to players carrying enough filled Travel Boxes.

```text
/function travelbox:encumbrance_disable
```

Disables global encumbrance. The movement-speed modifier is removed on the next tick.

```text
/function travelbox:encumbrance_toggle
```

Toggles the setting between enabled and disabled.

## Default behavior

Encumbrance is enabled whenever the datapack is loaded or `/reload` is run. The default is set by `travelbox:config/default`, which currently runs:

```mcfunction
scoreboard players set #encumbrance_enabled travelbox_config 1
```

To change the default, edit `data/travelbox/function/config/default.mcfunction` and set the value to either `1` (enabled) or `0` (disabled).

The current setting can be inspected with:

```text
/scoreboard players get #encumbrance_enabled travelbox_config
```

A value of `1` means enabled, and `0` means disabled.

## How the current implementation counts encumbrance

The counting logic lives in `data/travelbox/function/update_player.mcfunction` and is applied every tick by `travelbox:tick`.

The function does the following:

1. Removes the previous movement modifier.
2. Resets the player's `travel_boxes` scoreboard.
3. If encumbrance is enabled, counts marked Travel Boxes that are both:
   - identified by `minecraft:custom_data` with `travel_box:true`
   - non-empty, using `minecraft:container~{items:{size:{min:1}}}`
4. Applies the speed penalty for the resulting count.

This means empty Travel Boxes do not contribute to encumbrance.

## Current movement thresholds

The datapack applies the following penalties when the player is carrying the listed number of filled Travel Boxes:

| Filled Travel Boxes | Movement speed |
| --- | --- |
| 0–1 | 100% |
| 2 | 95% |
| 3 | 90% |
| 4 | 85% |
| 5 | 75% |
| 6 | 65% |
| 7 | 55% |
| 8+ | 45% |

## Testing and migration helpers

```text
/function travelbox:give
```

Gives the executing player a marked Travel Box for testing and verification.

```text
/execute as @a run function travelbox:migrate
```

Marks older Travel Boxes named `Travel Box` in each player's hotbar, inventory, and offhand so they are recognized by the current datapack. Run it once when migrating an existing world.

```text
/function travelbox:mark_placed
```

This is an implementation helper used by the advancement system to mark a newly placed valid shulker box as a Travel Box when it is placed in range.

## Internal and automatic functions

| Function | Purpose |
| --- | --- |
| `travelbox:load` | Adds the `travel_boxes` and `travelbox_config` scoreboards and loads the default encumbrance flag. |
| `travelbox:tick` | Runs `travelbox:update_player` for every online player each tick. |
| `travelbox:update_player` | Recalculates the player's filled Travel Box count and reapplies the movement-speed modifier. |
| `travelbox:config/default` | Defines the default value of `#encumbrance_enabled` after load or `/reload`. |
| `travelbox:mark_placed` | Marks a placed shulker box as a Travel Box when it matches the recipe and marker rules. |
| `travelbox:migrate` | Upgrades older named Travel Boxes to the current custom-data format. |

The functions `travelbox:encumbrance_enable`, `travelbox:encumbrance_disable`, and `travelbox:encumbrance_toggle` are the public configuration entry points. The rest are automated support functions and normally should not be run directly.

## Notes

- Travel Boxes are identified by `minecraft:custom_data` with `travel_box:true`.
- The recipe output is fixed in `data/travelbox/recipe/travel_box.json` and always creates a brown shulker box named `Travel Box` with the custom data marker.
- Existing worlds may need a migration pass before all older Travel Boxes are recognized correctly.
- The setting is global and applies to every player in the loaded world.