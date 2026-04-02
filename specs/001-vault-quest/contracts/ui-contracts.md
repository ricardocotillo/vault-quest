# UI Contracts: VaultQuest Interaction Flow

## 1. Kingdom Map (Main Dashboard)
- **Initial State**: Renders the "The Stash" at the top-center. Each `QuestLocation` is rendered as an interactive node on the map.
- **Node Interaction**: Tapping a `QuestLocation` opens a "Location HUD" (bottom sheet).
- **"Break the Seal" (Spend)**:
  - User long-presses the `QuestLocation` icon.
  - A wax seal appears and cracks with a haptic thud.
  - User drags their finger downwards to "extract" gold coins.
  - Amount input is shown on the HUD after the seal breaks.
- **"Sacrifice" (Reallocate)**:
  - User long-presses a "Healthy" `QuestLocation` icon until it starts floating.
  - User drags the floating icon onto an "Under Siege" (Goblins present) `QuestLocation`.
  - A "Sacrifice Confirmed" SFX plays, and the gold transfers.

## 2. Location HUD (Bottom Sheet)
- **Content**: Name of the Quest (e.g., "Dining Tavern"), remaining Gold (Balance), Budget for cycle, and recent "Adventures" (Transactions).
- **Primary Actions**: "Add Gold" (Fund from Stash), "Spend Gold" (Manual input fallback if seal break too cumbersome), "Edit Location".

## 3. Treasury (Savings)
- **Interaction**: Accessed by tapping a "Citadel/Vault" icon on the map.
- **Content**: History of harvested gold from past cycles.
- **"The Loot Drop" (End of Cycle)**:
  - A full-screen animation plays where any leftover gold from Quests flows into the Treasury.
  - A loot box appears and "explodes" with rewards (XP + Loot items).

## 4. Player Profile (Status Screen)
- **Content**: User Level, Character Avatar with gear, and XP progress bar (Mana Bar).
- **RPG Feedback**: Visual progress bar for "Leveling Up." Unlocked gear is equipped here.

## 5. Global Navigation
- **Architecture**: A persistent bottom navigation bar (if needed) or, ideally, an immersive "HUD" style interface that stays out of the way of the Kingdom Map.
