# API Contracts: VaultQuest (v1)

**Base URL**: `https://vault.cotillo.dev/api/v1/`

## 1. User & Profile
### `GET /profile`
- **Response**: `Player` entity with XP, Level, and Stash.
### `POST /profile/sync`
- **Request**: Local `Player` state updates.

## 2. Quests (Envelopes)
### `GET /quests`
- **Response**: List of `QuestLocation` entities with current balance and theme.
### `POST /quests/sync`
- **Request**: Local `QuestLocation` updates (balance shifts).

## 3. Transactions
### `GET /transactions`
- **Query**: `location_id`, `start_date`, `end_date`
- **Response**: List of `Transaction` entities.
### `POST /transactions`
- **Request**: Single or batch `Transaction` data.

## 4. Loot & Rewards
### `GET /loot`
- **Response**: List of available `Loot` and their metadata.
### `GET /loot/unlocked`
- **Response**: IDs of loot the user currently owns.

## 5. PayCycle
### `GET /paycycle/current`
- **Response**: `PayCycle` metadata (end date, harvest status).
### `POST /paycycle/harvest`
- **Request**: Trigger the "Loot Drop" and move funds to Treasury.
