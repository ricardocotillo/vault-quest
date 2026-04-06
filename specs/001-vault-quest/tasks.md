# Tasks: VaultQuest

## Implementation Strategy

We follow a **Test-Driven Logic** approach as mandated by the Constitution. We prioritize User Story 1 (Kingdom Map) as our MVP to establish the visual and structural foundation of the app. All monetary calculations must use the `decimal` package from day one.

- **MVP Phase**: Setup, Foundational, and User Story 1.
- **Incremental Delivery**: Subsequent User Stories (2-5) add interaction depth and RPG progression.
- **Verification**: Each Story Phase concludes with an Independent Test to verify the increment.

## Phase 1: Setup
Initialization of the Flutter project and infrastructure.

- [X] T001 Initialize Flutter project with `lib/` structure in root directory
- [X] T002 Configure `pubspec.yaml` with dependencies: `decimal`, `flutter_bloc`, `go_router`, `http`, `drift`, `sqlite3_flutter_libs`, `cached_network_image`, `vibration`, `audioplayers`, `google_fonts`
- [X] T003 [P] Create directory structure: `lib/core/{api,logic,theme}`, `lib/blocs`, `lib/models`, `lib/services`, `lib/ui/{screens,widgets,animations}`
- [X] T004 Setup "Digital Alchemist" theme colors and typography in `lib/core/theme/app_theme.dart` (per DESIGN.md)
- [X] T005 [P] Setup base `GoRouter` configuration in `lib/main.dart` with placeholder routes

## Phase 2: Foundational
Core logic, database, and API infrastructure.

- [X] T006 Implement Drift database schema for all entities in `lib/services/database.dart` (Player, QuestLocation, Transaction, Loot, PayCycle)
- [X] T007 [P] Create `Decimal` conversion utilities and currency logic in `lib/core/logic/currency_math.dart`
- [X] T008 Implement `http` API client with repository pattern in `lib/core/api/api_client.dart` targeting `https://vault.cotillo.dev/api/v1/`
- [X] T009 Create logic unit tests for currency math in `test/unit/currency_math_test.dart`
- [X] T010 [P] Setup `drift_dev` and run `build_runner` to generate database code

## Phase 3: User Story 1 - Kingdom Map (Priority: P1)
**Goal**: Visualize budget as a landscape.
**Independent Test**: Create Quest Locations and verify they render on the Kingdom Map with themed assets.

- [X] T011 [US1] Define `QuestLocation` and `Player` models in `lib/models/`
- [X] T012 [US1] Implement `KingdomMapBloc` to manage map state and location loading in `lib/blocs/kingdom_map_bloc.dart`
- [X] T013 [US1] Create `CustomPainter` for the Kingdom Map background and node layout in `lib/ui/animations/map_painter.dart`
- [X] T014 [US1] Implement `KingdomMapScreen` with high-contrast "Midnight Void" background in `lib/ui/screens/kingdom_map_screen.dart`
- [X] T015 [US1] Create interactive `QuestLocationNode` widget with themed pixel art in `lib/ui/widgets/quest_location_node.dart`
- [X] T016 [US1] Add widget test for Kingdom Map rendering in `test/widget/map_rendering_test.dart`

## Phase 4: User Story 2 - Tactile Envelope Funding & Spending (Priority: P1)
**Goal**: Physical-feeling interaction for managing money.
**Independent Test**: Perform a "Break the Seal" interaction and verify the balance deduction.

- [X] T017 [US2] Implement `BudgetBloc` to handle funding and spending logic in `lib/blocs/budget_bloc.dart`
- [X] T018 [US2] Create "Break the Seal" animation controller and visual seal effect in `lib/ui/animations/seal_animation.dart`
- [X] T019 [US2] Implement `LocationHUD` bottom sheet with "Digital Alchemist" parchment style in `lib/ui/widgets/location_hud.dart`
- [X] T020 [US2] Integrate `vibration` and `audioplayers` for "Break the Seal" haptic/sound cues in `lib/services/haptics_service.dart`
- [X] T021 [US2] Implement spending input with blinking block cursor in `lib/ui/widgets/spending_input.dart`
- [X] T022 [US2] Add unit test for budget deduction logic in `test/unit/budget_logic_test.dart`

## Phase 5: User Story 3 - The Boss Battle: Handling Overspending (Priority: P1)
**Goal**: Friction of overspending via "Sacrifice" mechanic.
**Independent Test**: Attempt to spend from an empty category and perform a "Sacrifice" from another.

- [X] T023 [US3] Implement "Under Siege" visual state (Goblins) for Quest Locations with zero balance in `lib/ui/widgets/quest_location_node.dart`
- [X] T024 [US3] Setup `Draggable` and `DragTarget` for "Sacrifice" (reallocation) interaction in `lib/ui/screens/kingdom_map_screen.dart`
- [X] T025 [US3] Implement `Overlay` animation for "flying gold" coins during Sacrifice in `lib/ui/animations/gold_transfer_animation.dart`
- [X] T026 [US3] Add validation logic to prevent "Sacrifice" from Stash or Treasury in `lib/blocs/budget_bloc.dart`
- [X] T027 [US3] Add integration test for Sacrifice journey in `test/integration/sacrifice_journey_test.dart`

## Phase 6: User Story 4 - Progression & Loot (Priority: P2)
**Goal**: Reward discipline through XP and Leveling.
**Independent Test**: Log in and stay under budget to earn XP and trigger map evolution.

- [X] T028 [US4] Implement `PlayerProfileBloc` to track XP, Level, and Loot in `lib/blocs/player_profile_bloc.dart`
- [X] T029 [US4] Create level-to-asset mapping for Kingdom Map evolution (Campsite -> Village -> Citadel) in `lib/core/logic/evolution_logic.dart`
- [X] T030 [US4] Implement `PlayerProfileScreen` (Status Screen) with "Mana Bar" progress in `lib/ui/screens/profile_screen.dart`
- [X] T031 [US4] Setup `Loot` unlock system and inventory UI in `lib/ui/widgets/loot_inventory.dart`
- [X] T032 [US4] Add unit tests for XP calculation and leveling logic in `test/unit/progression_test.dart`

## Phase 7: User Story 5 - The Loot Drop: End of Cycle Harvest (Priority: P2)
**Goal**: Celebratory end of pay cycle harvest.
**Independent Test**: Trigger end of cycle and verify funds move to Treasury with reward animation.

- [X] T033 [US5] Implement `PayCycle` tracking and "End Cycle" trigger in `lib/blocs/budget_bloc.dart`
- [X] T034 [US5] Create full-screen "Loot Drop" celebration animation with `audioplayers` fanfare in `lib/ui/animations/loot_drop_animation.dart`
- [X] T035 [US5] Implement Treasury (Savings) screen to view harvested gold history in `lib/ui/screens/treasury_screen.dart`
- [X] T036 [US5] Add integration test for end-of-cycle harvest in `test/integration/harvest_test.dart`

## Phase 8: Polish & Cross-Cutting
Final "Digital Alchemist" refinements and global performance gating.

- [X] T037 [P] Implement "Pixel-Dithering" background gradients using GLSL fragment shaders in `lib/core/theme/dither_shader.dart`
- [X] T038 [P] Optimize Kingdom Map rendering to ensure consistent 60fps on target devices
- [X] T039 Implement remote sync logic for shared kingdoms (Partner mode) in `lib/services/sync_service.dart`
- [X] T040 Final audit for "No-Line" rule and tonal transitions across all screens

## Dependencies

1. **Phase 1** must be complete before any UI development.
2. **Phase 2** (Database/Math) is required for **Phase 4** (Budgeting).
3. **Phase 3** (Kingdom Map) is required for **Phase 5** (Sacrifice interaction).
4. **Phase 4 & 6** are prerequisites for **Phase 7** (Harvesting).

## Parallel Execution Examples

- **US1 & US2 Foundations**: T011 (Models) and T017 (Budget Logic) can be worked on in parallel once Phase 1 is done.
- **Visuals & Logic**: T013 (Map Painter) and T008 (API Client) can be developed independently.
- **US4 (Progression)**: Can be developed in parallel with US3 (Overspending) if core database is ready.
