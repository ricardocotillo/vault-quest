# Data Model: VaultQuest

## Entities

### Player
Represents the user's RPG identity and total available funds.
- **id**: UUID
- **name**: String
- **xp**: Integer (Total experience earned)
- **level**: Integer (Current level calculated from XP)
- **stash_balance**: Decimal (Unallocated funds - "The Stash")
- **unlocked_loot**: List<LootID> (IDs of gear and map decorations)
- **last_login**: Timestamp

### QuestLocation (Envelope)
A specific budget category represented on the Kingdom Map.
- **id**: UUID
- **name**: String (e.g., "Grocery Granary")
- **theme**: Enum (GRANARY, TAVERN, ARMORY, etc.)
- **current_balance**: Decimal (Remaining funds in the envelope)
- **allocated_budget**: Decimal (Target amount for the current pay cycle)
- **is_under_siege**: Boolean (True if balance is zero or negative)
- **coordinates**: Point (Position on the Kingdom Map)

### Transaction
A record of money moving in or out of a QuestLocation.
- **id**: UUID
- **location_id**: UUID (Reference to QuestLocation)
- **amount**: Decimal (Positive or negative)
- **type**: Enum (SPEND, FUND, SACRIFICE_IN, SACRIFICE_OUT, HARVEST)
- **timestamp**: Timestamp
- **description**: String (User-provided context)

### Loot
Unlockable items for character or kingdom customization.
- **id**: UUID
- **name**: String
- **category**: Enum (AVATAR_GEAR, MAP_DECORATION)
- **rarity**: Enum (COMMON, RARE, EPIC, LEGENDARY)
- **visual_asset_path**: String

### PayCycle
Defines the timeframe for budgeting and the "Loot Drop".
- **id**: UUID
- **start_date**: Timestamp
- **end_date**: Timestamp
- **is_completed**: Boolean
- **total_harvested**: Decimal (Amount moved to Treasury at end of cycle)

## Relationships
- **Player (1) ↔ QuestLocation (N)**: A player manages many budget envelopes.
- **QuestLocation (1) ↔ Transaction (N)**: Each envelope tracks its own history.
- **Player (1) ↔ Loot (N)**: A player owns multiple unlocked rewards.
- **PayCycle (1) ↔ Transaction (N)**: Transactions occur within a cycle.

## Validation Rules
- **Decimal Precision**: All monetary values MUST be validated to 2 decimal places using the `decimal` package.
- **Non-Negative Stash**: "The Stash" SHOULD not go negative; if it does, trigger a "Bankruptcy" alert.
- **Zero-Sum Sacrifices**: A SACRIFICE_IN transaction MUST be accompanied by a matching SACRIFICE_OUT from another location.
