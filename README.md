# Travel Box Shulkers

Travel Box Shulkers is an intermediate early-game storage solution. It adds a craftable brown shulker box that provides some of the convenience of a normal shulker box before the player has access to shulker shells.

Travel Boxes are intentionally slightly weaker than regular shulker boxes: carrying several at once reduces the player's movement speed. This makes them useful for exploration and organization without removing the progression value of finding the End and crafting standard shulker boxes.

## What it adds

- A craftable item called the **Travel Box**.
- A brown shulker box appearance so it can be used like other shulker boxes.
- A recipe using leather, string, gold ingots, and a chest.
- Automatic detection of Travel Boxes in the player's inventory and offhand.
- Movement-speed penalties based on how many Travel Boxes the player carries.

## Encumbrance

When you carry multiple Travel Boxes, you begin to feel an effect called **Encumbrance**. Encumbrance negatively impacts your movement speed.

Carrying zero or one Travel Box has no movement penalty. The default penalties are:

| Travel Boxes carried | Movement speed |
| --- | --- |
| 0-1 | 100% |
| 2 | 95% |
| 3 | 90% |
| 4 | 85% |
| 5 | 75% |
| 6 | 65% |
| 7 | 55% |
| 8 or more | 45% |

The datapack counts Travel Boxes by their internal marker rather than by color alone. This prevents ordinary brown shulker boxes from being treated as Travel Boxes.

## Progression role

Travel Boxes are designed for the part of the game before shulker boxes are readily available. Their recipe uses accessible overworld materials, but the movement penalty discourages carrying large numbers of them as a permanent replacement for End-game storage.

Once regular shulker boxes become available, they remain the stronger option because they do not apply Travel Box encumbrance.

## Configuration

Encumbrance is enabled by default. Operators can enable, disable, or toggle it with the functions documented in [CONFIGURATION.md](CONFIGURATION.md).

The setting is global and affects all players in the world.
