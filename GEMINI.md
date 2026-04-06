<!--
Sync Impact Report
- Version change: 1.1.0 → 1.2.0
- List of modified principles:
  - PRINCIPLE_1: I. Precision & Integrity (Math) (unchanged)
  - PRINCIPLE_2: II. Gamification UX (Game-First) (unchanged)
  - PRINCIPLE_3: III. High-Performance Dashboard (unchanged)
  - PRINCIPLE_4: IV. Local-First Security & Privacy (unchanged)
  - PRINCIPLE_5: V. Modular Architecture (Quests & Loot) (unchanged)
- Modified sections: Technology & Tools (corrected to BLoC, added drift/vibration/audioplayers), Folder Structure (aligned to actual lib/ layout), Coding Standards (Blocs not Notifiers)
- Removed sections: None
- Templates requiring updates:
  - .specify/templates/plan-template.md (✅ updated)
  - .specify/templates/spec-template.md (✅ updated guidance)
  - .specify/templates/tasks-template.md (✅ updated guidance)
- Follow-up TODOs: None
-->

# VaultQuest Constitution

## Core Principles

### I. Precision & Integrity (Math)

Financial accuracy is non-negotiable. Use `Decimal` or cents (`int`) for all currency values — NEVER use `double` for money. BigInt or dedicated currency libraries (e.g., `decimal`) MUST be used to eliminate floating-point errors. Every "Vault" (envelope) logic component MUST achieve at least 90% test coverage.

### II. Gamification UX (Game-First)

Maintain a "Modern Pixel Art" aesthetic across all components. Every financial interaction MUST trigger a tactile, rewarding animation or sound cue to reinforce the "Game-First" design system.

- **RPG UI:** Use custom animations for all financial actions. Avoid standard Material "snackbars"; use "Loot Popups" or "Quest Alerts" instead.
- **Tactility:** Every button press MUST include subtle haptic feedback (`HapticFeedback.lightImpact`).
- **Theme:** Dark-mode-first "Midnight" theme with Neon Gold (`#FFD700`) and Mana Blue (`#00AEEF`) accents.

### III. High-Performance Dashboard

The "Kingdom Map" dashboard MUST render instantly, even with dozens of active categories. All animations MUST maintain a consistent 60fps to preserve the immersive game feel.

### IV. Local-First Security & Privacy

All financial data is treated as highly sensitive. Store data locally by default to ensure privacy. Any cloud-syncing features MUST employ strict encryption protocols for end-to-end security.

### V. Modular Architecture (Quests & Loot)

The system MUST be highly modular. Adding new "Quest types" (budget categories) or "Loot" (rewards) SHOULD be possible without refactoring core system logic, enabling rapid expansion of game mechanics. Each new feature domain MUST introduce its own `Bloc` in `lib/blocs/` to keep concerns separated.

## Technology & Tools

- **Framework**: Flutter 3.x (Stable), Dart — optimized for 60fps rendering.
- **State Management**: BLoC (`flutter_bloc`). MANDATORY — no other state management pattern (Riverpod, Provider, ChangeNotifier, etc.) is permitted.
- **Navigation**: GoRouter.
- **Local DB**: Drift (SQLite).
- **Math**: `decimal` package for all currency operations.
- **Haptics & Audio**: `vibration` and `audioplayers` packages.
- **Networking**: `http` package; `cached_network_image` for image caching.
- **Fonts**: `google_fonts`.
- **Testing**: `flutter_test` + `mocktail` with a 90% coverage threshold for core logic.
- **Assets**: Modern Pixel Art style for UI; optimized sprites and fragment shaders for performance.
- **Iconography**: `Material Design Icons` wrapped in custom "Artifact" widgets.
- **Commands**: `flutter pub get` / `flutter run` / `flutter test`.

## Folder Structure

- `lib/blocs/`: BLoC classes (budget, kingdom map, player profile).
- `lib/core/api/`: API client and networking.
- `lib/core/logic/`: Core financial math (`currency_math`) and progression (`evolution_logic`).
- `lib/core/theme/`: App theme, shaders.
- `lib/models/`: Data models (player, quest location).
- `lib/services/`: Database (Drift), repositories, haptics, and sync.
- `lib/ui/animations/`: RPG animations (gold transfer, loot drop, seal, map painter).
- `lib/ui/components/`: Reusable UI components (HUD stats, mana bar, structure card, tokens, effects).
- `lib/ui/screens/`: Top-level screens (kingdom map, profile, treasury).
- `lib/ui/widgets/`: Composite widgets (location HUD, loot inventory, quest nodes, spending input).

## Coding Standards

- **Naming**: Classes in `PascalCase`, files in `snake_case`.
- **State Management**: All reactive state MUST be managed via `Bloc` classes in `lib/blocs/`. NEVER use `ChangeNotifier`, `ValueNotifier`, Riverpod, or raw `setState` for business logic.
- **Logic Placement**: Keep UI "dumb." All financial math and XP logic MUST live in `Bloc` or `Service` classes. Widgets MUST obtain state exclusively through `BlocProvider`/`BlocBuilder`/`BlocListener`.
- **Precision**: Always use `Decimal` or `cents` (int) for money. NEVER use `double` for currency.

## Development Workflow

1. **Test-Driven Logic**: TDD is mandatory for financial logic to ensure mathematical integrity.
2. **Performance Gating**: UI changes must be verified against the 60fps performance target on real devices.
3. **Modular Expansion**: New features must follow the "Quest/Loot" modular pattern to prevent technical debt.
4. **Local-First Verification**: Every feature must be fully functional offline before cloud sync is considered.

## Governance

- This Constitution takes absolute precedence over all other development practices and conventions.
- Amendments require a version bump and updated documentation in this file.
- All Pull Requests must verify compliance with these principles as part of the review process.
- Versioning follows semantic rules (MAJOR for principle removals, MINOR for additions, PATCH for clarifications).

**Version**: 1.2.0 | **Ratified**: 2026-04-01 | **Last Amended**: 2026-04-06
