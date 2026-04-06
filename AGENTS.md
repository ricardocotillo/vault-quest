<!--
Sync Impact Report
- Version change: 0.0.0 → 1.0.0
- List of modified principles:
  - PRINCIPLE_1: [PRINCIPLE_1_NAME] → I. Precision & Integrity (Math)
  - PRINCIPLE_2: [PRINCIPLE_2_NAME] → II. Gamification UX (Game-First)
  - PRINCIPLE_3: [PRINCIPLE_3_NAME] → III. High-Performance Dashboard
  - PRINCIPLE_4: [PRINCIPLE_4_NAME] → IV. Local-First Security & Privacy
  - PRINCIPLE_5: [PRINCIPLE_5_NAME] → V. Modular Architecture (Quests & Loot)
- Added sections: Technology & Tools, Development Workflow
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

Financial accuracy is non-negotiable. Use BigInt or dedicated currency libraries (e.g., `decimal`) to eliminate floating-point errors. Every "Vault" (envelope) logic component MUST achieve at least 90% test coverage.

### II. Gamification UX (Game-First)

Maintain a "Modern Pixel Art" aesthetic across all components. Every financial interaction MUST trigger a tactile, rewarding animation or sound cue to reinforce the "Game-First" design system.

### III. High-Performance Dashboard

The "Kingdom Map" dashboard MUST render instantly, even with dozens of active categories. All animations MUST maintain a consistent 60fps to preserve the immersive game feel.

### IV. Local-First Security & Privacy

All financial data is treated as highly sensitive. Store data locally by default to ensure privacy. Any cloud-syncing features MUST employ strict encryption protocols for end-to-end security.

### V. Modular Architecture (Quests & Loot)

The system MUST be highly modular. Adding new "Quest types" (budget categories) or "Loot" (rewards) SHOULD be possible without refactoring core system logic, enabling rapid expansion of game mechanics.

## Technology & Tools

- **Language**: Flutter/Dart (optimized for 60fps rendering).
- **Math**: BigInt or `decimal` package for all currency operations.
- **Testing**: `flutter_test` with a 90% coverage threshold for core logic.
- **Assets**: Modern Pixel Art style for UI; optimized sprites for performance.

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

**Version**: 1.0.0 | **Ratified**: 2026-04-01 | **Last Amended**: 2026-04-01
