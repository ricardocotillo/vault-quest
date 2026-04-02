# Research: VaultQuest Technical Foundation

## 1. High-Precision Currency with `decimal`
**Decision**: Use the `decimal` package for all monetary calculations.
**Rationale**: Flutter/Dart's `double` is prone to floating-point errors. `decimal` provides arbitrary-precision decimal numbers, which is mandatory for financial integrity (Constitution Principle I).
**Implementation**:
- Store values as `String` or `Int` (cents) in the database and convert to `Decimal` for logic.
- Rounding strategy: `MidpointRounding.toEven` (Banker's rounding) where applicable.

## 2. 60fps Kingdom Map & Evolutions
**Decision**: Use `CustomPainter` for the map layout and `flame` or `sprite` animations for map elements.
**Rationale**: A grid of standard widgets will be too heavy for the "hand-drawn map" feel and 60fps goal. `CustomPainter` allows for efficient layering and precise control over the "Digital Alchemist" aesthetic.
**Evolution Logic**: Use a state-driven `MapRenderer` that swaps asset sets (campsite/village/citadel) based on the `PlayerProfile.level`.

## 3. Tactile and Sound Cues
**Decision**: Use `vibration` and `audioplayers` packages.
**Rationale**:
- `vibration` allows for specific haptic patterns (e.g., a "heavy" thud for the "Break the Seal" action).
- `audioplayers` is the industry standard for low-latency SFX in Flutter.
**Interactions**:
- "Break the Seal": Heavy haptic + "Clink" SFX.
- "Sacrifice": Continuous light haptic during drag + "Whoosh" SFX.
- "Level Up": Multi-stage haptic + Fanfare SFX.

## 4. Drag-and-Drop "Sacrifice" Mechanic
**Decision**: Use Flutter's `Draggable` and `DragTarget` with a `Overlay` for the "flying gold" animation.
**Rationale**: Provides the most native-feeling interaction. The `Overlay` ensures the "gold" appears above all map locations during the transfer.

## 5. "Digital Alchemist" Theme Implementation
**Decision**: Custom `ThemeData` with strict color overrides and `GoogleFonts.spaceGrotesk` / `GoogleFonts.manrope`.
**Rationale**: strictly adhere to `FLUTTER_DESIGN.md`.
**Key Colors**:
- Midnight Void: `#1A063B` (Scaffold Background)
- Gilded Gold: `#E9C400` (Primary)
- Life Essence: `#66DD8B` (Secondary)
- Rustic Parchment: `#DAC49B` (Tertiary)

## 6. Remote Sync via `http` & API
**Decision**: Use `http` for a lightweight REST client targeting `vault.cotillo.dev/api/v1/`.
**Rationale**: Flutter's `http` package is robust and sufficient for standard RESTful sync. It avoids the overhead of larger packages like `dio` while providing excellent control over headers and retry logic.
**Implementation**:
- Repository Pattern to abstract the API from the BLoCs.
- `JSON` for serialization/deserialization.
- `cached_network_image` for efficient loading of RPG assets (sprites, loot icons) from the API.

## 7. State Management with `flutter_bloc`
**Decision**: Use `flutter_bloc` to manage complex game and budget states.
**Rationale**: BLoC provides a predictable state machine ideal for RPG-like progression (Level Up, Sacrifice, Loot Drops). It separates business logic (e.g., XP calculation) from the UI effectively.
**Key BLoCs**:
- `KingdomMapBloc`: Manages the state of quest locations and map evolution.
- `BudgetBloc`: Handles transaction logic, "The Stash," and currency math.
- `PlayerProfileBloc`: Tracks XP, Level, and equipped Loot.

## 8. Routing with `go_router`
**Decision**: Use `go_router` for declarative navigation.
**Rationale**: Simplifies deep linking (e.g., jumping to a specific Quest from a notification) and handles complex navigation stacks (Map -> HUD -> Transaction History) with ease.

## 9. "Digital Alchemist" Visual Implementation (DESIGN.md)
**Decision**: Custom `ThemeData` with 0px radius, high-contrast palette, and tonal transitions.
**Implementation Details**:
- **Blinking Block Cursor**: Custom `TextSelectionControls` or a basic timer-driven `Container` in a `Stack`.
- **Dithering Gradients**: Use `FragmentShader` (GLSL) for stepped background gradients to mimic 16-bit hardware on mobile.
- **Glass & Gradient HUD**: `BackdropFilter` with `ImageFilter.blur` (20px) and a semi-transparent `surfaceBright` overlay.
- **No-Line Rule**: Enforced via `Decoration` without `border` and using `Color` shifts for separation.
