# Travel Box configuration

Travel Box configuration is controlled by scoreboard values. The setting is global: it applies to every player in the world.

## Commands

Run these commands as an operator or from the server console:

```text
/function travelbox:encumbrance_enable
```

Enables encumbrance. Carrying two or more Travel Boxes reduces movement speed according to the thresholds in `data/travelbox/function/update_player.mcfunction`.

```text
/function travelbox:encumbrance_disable
```

Disables encumbrance and removes the movement-speed modifier on the next tick.

```text
/function travelbox:encumbrance_toggle
```

Switches between enabled and disabled.

## Default behavior

Encumbrance is enabled whenever the datapack is loaded or `/reload` is run. This is controlled by `travelbox:config/default` in the load function. To change the default, edit that function to call either `travelbox:encumbrance_enable` or `travelbox:encumbrance_disable`.

The current setting can be inspected with:

```text
/scoreboard players get #encumbrance_enabled travelbox_config
```

The value `1` means enabled and `0` means disabled. Avoid changing the objective name or fake-player name unless you also update `update_player.mcfunction`.

## Function reference

### Movement encumbrance configuration

```text
/function travelbox:encumbrance_enable
```

Enables movement-speed encumbrance globally.

```text
/function travelbox:encumbrance_disable
```

Disables movement-speed encumbrance globally. The modifier is removed on the next tick.

```text
/function travelbox:encumbrance_toggle
```

Toggles movement-speed encumbrance globally.

These three functions control the global `encumbrance_enabled` setting and the `travelbox:encumbrance` movement-speed modifier applied by the datapack.

### Testing and migration

```text
/function travelbox:give
```

Gives the executing player a marked Travel Box for testing. Run it as a player, or use `execute as` when running it from the server console.

```text
/execute as @a run function travelbox:migrate
```

Marks older Travel Boxes named `Travel Box` in each player's hotbar, inventory, and offhand so they can be recognized by the datapack. Run this once when migrating an existing world.

### Automatic and internal functions

| Function | Purpose |
| --- | --- |
| `travelbox:load` | Creates the datapack scoreboards and loads the default encumbrance setting. Runs from the load function tag. |
| `travelbox:tick` | Updates every online player's Travel Box count and movement modifier. Runs from the tick function tag. |
| `travelbox:update_player` | Counts the executing player's marked Travel Boxes and applies or removes the movement-speed modifier. |
| `travelbox:config/default` | Selects the encumbrance setting used after loading or `/reload`. |

The `encumbrance_enable`, `encumbrance_disable`, and `encumbrance_toggle` functions are public configuration entry points. The other functions in the table are called automatically or are implementation details and normally should not be run directly.

## Notes

- Travel Boxes are identified by `minecraft:custom_data` with `travel_box:true`.
- The datapack marks matching Travel Boxes in the player inventory automatically.
- Existing Travel Boxes may need one tick in a loaded player inventory before they are counted.
- The recipe and Travel Box item name are currently fixed in `data/travelbox/recipe/travel_box.json`.