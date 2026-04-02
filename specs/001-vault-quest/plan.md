# Implementation Plan: VaultQuest

**Branch**: `001-vault-quest` | **Date**: 2026-04-01 | **Spec**: [specs/001-vault-quest/spec.md](spec.md)
**Input**: Feature specification from `/specs/001-vault-quest/spec.md`

## Summary
Build "VaultQuest," a personal finance app that transforms the Envelope Budgeting method into a progression-based RPG adventure. The technical approach involves a Flutter-based mobile application utilizing the `decimal` package for high-precision currency math, a local-first storage architecture with remote sync capabilities via a dedicated API (`vault.cotillo.dev/api/v1/`), and a "Digital Alchemist" design system that rejects modern flat aesthetics for high-contrast, tactile RPG-inspired visuals.

## Technical Context

**Language/Version**: Dart 3.x / Flutter 3.x
**Primary Dependencies**: `decimal` (currency), `flutter_bloc` (state management), `go_router` (routing), `http` (networking), `cached_network_image` (image loading), `drift` (local storage)
**API Base URL**: `https://vault.cotillo.dev/api/v1/`
**Storage**: Local-First with Remote Sync (SQLite via `drift`)
**Testing**: `flutter_test` (90% coverage target for logic)
**Target Platform**: iOS 15+, Android 12+
**Project Type**: Mobile App
**Performance Goals**: 60 fps for all animations and map interactions
**Constraints**: Offline-capable by default, <200ms interaction latency
**Scale/Scope**: ~10 core screens, complex custom painter/animation for Kingdom Map, high-contrast "Digital Alchemist" theme

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- [x] **Precision**: Does this feature use BigInt/Decimal for all currency? (Yes, `decimal` package mandatory)
- [x] **Performance**: Will this maintain 60fps? Is the dashboard impact minimal? (Yes, goal is 60fps)
- [x] **UX/Gamification**: Are tactile/sound cues integrated into the UX? (Yes, core to the RPG adventure)
- [x] **Local-First**: Does this work fully offline? Is encryption handled if syncing? (Yes, Local-First with drift)
- [x] **Modularity**: Does this follow the Quest/Loot pattern without core refactors? (Yes, architecture designed for Quests/Loot)

## Project Structure

### Documentation (this feature)

```text
specs/001-vault-quest/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output
├── quickstart.md        # Phase 1 output
├── contracts/           # Phase 1 output
└── tasks.md             # Phase 2 output
```

### Source Code (repository root)

```text
lib/
├── core/                # Shared utilities, constants, theme
│   ├── api/             # API client and endpoints
│   ├── logic/           # Core RPG and Budgeting math
│   └── theme/           # "Digital Alchemist" design system (DESIGN.md)
├── blocs/               # Flutter BLoC implementations
├── models/              # Entity definitions (Stash, Quest, Loot)
├── services/            # Persistence (Drift), Auth, Sound
├── ui/
│   ├── screens/         # Kingdom Map, Treasury, Quest Details
│   ├── widgets/         # Tactical Envelopes, Progress Bars
│   └── animations/      # Custom painter and animation controllers
└── main.dart            # GoRouter configuration and app entry
test/
├── unit/                # Core logic and math tests
├── widget/              # Component and screen tests
└── integration/         # E2E user journeys
```

**Structure Decision**: Single Flutter project structure optimized for BLoC-based state management and "Digital Alchemist" theme separation.

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| None | N/A | N/A |
