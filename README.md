# Travel Box Shulkers

Travel Box Shulkers is an intermediate early-game storage solution. It adds a craftable brown shulker box that provides some of the convenience of a normal shulker box before the player has access to shulker shells.

Travel Boxes are intentionally slightly weaker than regular shulker boxes: carrying several at once reduces the player's movement speed. This makes them useful for exploration and organization without removing the progression value of finding the End and crafting standard shulker boxes.

## What it adds

- A craftable item called the **Travel Box**.
- A brown shulker box appearance that behaves like a normal shulker box.
- A recipe using leather, string, gold ingots, and a chest.
- Automatic detection of Travel Boxes in the player's inventory and offhand.
- Movement-speed penalties based on how many Travel Boxes the player carries.

## Encumbrance

Carrying empty Travel Boxes does not negatively affect you. However, if your Travel Box contains any amount of items, it begins to give you **Encumbrance**. Encumbrance negatively affects your movement speed.

The default encumbrance thresholds are:

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

The global speed modifier is recalculated every tick by `travelbox:update_player`, which removes the old modifier, counts the player's non-empty Travel Boxes, and reapplies the penalty for the new total.

## Progression role

Travel Boxes are designed for the part of the game before shulker boxes are widely available or before the player has ready access to shulker shells. Their recipe uses accessible overworld materials, but the movement penalty discourages carrying large numbers as a permanent replacement for proper shulker boxes.

Once regular shulker boxes are available, they remain the stronger option because they do not apply Travel Box encumbrance.

## Configuration

Encumbrance is enabled by default. Operators can enable, disable, or toggle it globally with the public functions described in [CONFIGURATION.md](CONFIGURATION.md).

The setting is global and affects every player in the world.
