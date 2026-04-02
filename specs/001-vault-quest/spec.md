# Feature Specification: VaultQuest

**Feature Branch**: `001-vault-quest`  
**Created**: 2026-04-01  
**Status**: Draft  
**Input**: User description: "Build 'VaultQuest,' a personal finance app that transforms the Envelope Budgeting method into a progression-based RPG adventure. WHY: Traditional budgeting is tedious and anxiety-inducing. VaultQuest makes financial discipline feel like a rewarding quest, using 'psychological friction' to stop overspending and 'variable rewards' to encourage saving. CORE FEATURES: 1. THE STASH & THE KINGDOM: The main dashboard is a 'Kingdom Map.' The user's total available balance is 'The Stash.' Each budget category is a 'Quest Location' (e.g., The Grocery Granary, The Dining Tavern). 2. TACTILE ENVELOPES: Users must be able to create 'Quests' (Envelopes) and fund them from 'The Stash.' Spending money requires a 'Break the Seal' interaction where the user visually extracts gold from a specific chest. 3. THE BOSS BATTLE (Overspending): If a Quest is empty, the location looks 'Under Siege' by Goblins. To spend more, the user must perform a 'Sacrifice'—visually dragging gold from a different, healthy Quest to the depleted one. 4. PROGRESSION SYSTEM: - Users earn XP for daily logging and staying under budget. - As they level up, their 'Kingdom Map' evolves from a campsite to a stone village, then a fortified citadel. - Saving milestones unlock 'Loot' (avatar gear or map decorations). 5. THE LOOT DROP: At the end of a pay cycle, any remaining 'Gold' in Quests is automatically harvested into a 'Treasury' (Savings), triggering a celebratory reward animation. USER STORIES: - As a user, I want to see my budget as a landscape so I can visualize my financial health at a glance. - As a user, I want a tactile way to move money between envelopes so I feel the 'cost' of my trade-offs. - As a user, I want to earn 'Gear' for my character when I hit my savings goals to stay motivated."

## Clarifications

### Session 2026-04-01

- Q: How is the transition to the next pay cycle (and the "Loot Drop" harvest) triggered? → A: User choice in settings.
- Q: How are transactions (spending) initially entered into VaultQuest? → A: Option for manual or bank sync.
- Q: Does VaultQuest include any social or multiplayer features? → A: Option for solo or shared (couples).
- Q: Is cloud-based persistence and authentication required? → A: Is cloud-based persistence and authentication required, Yes.
- Q: What is the intended monetization model for VaultQuest? → A: Choice of Freemium or One-time purchase models.
- Q: When a new pay cycle begins, should budget allocations (Quest targets) reset to zero, or persist? → A: Persist from previous cycle (Auto-carry).
- Q: In a Shared Kingdom (couples), how is "The Stash" managed? → A: Shared Stash (Single joint pool).
- Q: What is the primary driver for earning XP? → A: Daily Check-in & Under-Budget status.

## User Scenarios & Testing _(mandatory)_

### User Story 1 - Visualize Budget as Kingdom Map (Priority: P1)

The user wants to see their financial status as a thriving or struggling kingdom rather than just numbers.
...

- **FR-015**: System MUST persist budget allocations (Quest targets) from the previous pay cycle by default during transitions.
- **FR-016**: System MUST implement a "Shared Stash" (joint pool) model for Shared Kingdoms, where both partners draw from and contribute to the same unallocated fund pool.
- **FR-017**: System MUST generate XP primarily through daily user engagement (check-ins) while the Kingdom is in a healthy, under-budget state.

### Key Entities _(include if feature involves data)_

- **The Stash**: Represents the available, unallocated funds (Shared joint pool in Shared Kingdom).
- **Quest Location (Envelope)**: A shared budget category with a balance, a name, and a visual theme.
- **Quest (Budget)**: The plan for a specific Quest Location for a pay cycle; persists as a template for subsequent cycles.
  ...
- **Loot Shop Config**: Storefront for premium loot and map themes.

## Success Criteria _(mandatory)_

### Measurable Outcomes

...
...

## Assumptions

- **Flutter/Dart**: The project uses Flutter as specified in the Constitution.
- **Local-First**: Data is stored on the device; cloud sync is a secondary concern.
- **Bank Sync**: Bank sync is an optional enhancement; manual entry is the core tactile requirement.
- **Shared Mode**: Shared mode will require a cloud-based persistence layer.
- **Optional Auth**: Authentication is only required for cloud features; the app remains fully functional locally without login.
- **Monetization Choice**: The app supports both in-app purchases and one-time unlock options based on user preference.
- **Pixel Art Assets**: Custom or high-quality pixel art assets will be available for the locations and evolutions.
- **Mobile First**: The primary target platform is mobile (iOS/Android) given the tactile nature of the app.
