# Design System Strategy: VaultQuest RPG Editorial

## 1. Overview & Creative North Star: "The Digital Alchemist"
This design system moves away from the sterile, flat world of modern fintech and embraces the "Digital Alchemist" North Star. We are not building a spreadsheet; we are crafting a magical inventory for a user’s financial life. 

The aesthetic marries the nostalgia of 16-bit RPGs with the high-end polish of editorial design. We break the "template" look through **Intentional Asymmetry** (treating the screen like a hand-drawn map rather than a rigid grid) and **Tactile Depth** (elements that feel carved, stacked, or illuminated). By utilizing extreme contrast between deep "void" purples and luminous "mana" emeralds, we transform mundane transactions into heroic quests.

## 2. Colors: High-Contrast Luminance
Color in this system isn't just decoration—it is functional storytelling. We use depth and light to guide the eye, eliminating the need for clumsy structural lines.

### The Palette & Roles
*   **Background (`surface` / `#1a063b`):** The "Midnight Void." All high-level exploration happens here.
*   **Primary (`primary` / `#e9c400`):** The "Gilded Gold." Reserved for currency, wealth metrics, and critical calls to action.
*   **Secondary (`secondary` / `#66dd8b`):** The "Life Essence." Used for positive growth, "health" (savings goals), and progress.
*   **Tertiary (`tertiary` / `#dac49b`):** The "Rustic Parchment." Used for informational cards and interactive paper-like surfaces.

### The "No-Line" Rule
Prohibit the use of 1px solid borders to section content. Boundaries must be defined by **Tonal Transitions**. A card should be a `surface-container-low` block sitting on a `surface` background. If you need to separate two items, use a background shift or a `1.5` spacing gap—never a line.

### Surface Hierarchy & Nesting
Treat the UI as a physical stack of materials. 
1.  **Base:** `surface` (The deep world).
2.  **Sections:** `surface-container` (Raised stone platforms).
3.  **Actionable Cards:** `tertiary` (Parchment scrolls laid upon the stone).
4.  **Floating Elements:** Use the **Glass & Gradient Rule**. Apply `surface-bright` with a 40% opacity and a `20px` backdrop-blur to simulate a magical "HUD" overlay.

## 3. Typography: The Pixel-Editorial Hybrid
We use a high-contrast typographic scale to balance "Game Aesthetic" with "Financial Authority."

*   **Display & Headline (Space Grotesk):** While the user requested pixel fonts, we utilize **Space Grotesk** for our high-level headers. Its geometric, slightly "tech" feel mimics the structure of pixel art while maintaining the legibility required for a premium finance app.
*   **Body & Title (Manrope):** We use **Manrope** for all functional reading. It is a high-performance sans-serif that provides "The Anchor" to the system—ensuring that while the app looks like a game, it reads like a bank.
*   **Label (Space Grotesk):** Small caps or high-tracking labels provide that "Status Screen" feel.

**Typography as Identity:** Use `headline-lg` in `primary` (Gold) for big numbers. Use `body-sm` in `on-surface-variant` for metadata. The contrast between a massive, bold Gold number and a tiny, crisp Purple label is what creates the "Editorial" look.

## 4. Elevation & Depth: Tonal Layering
Traditional shadows are too "web 2.0." In this system, we use **Ambient Lighting** and **Dimensional Bevels**.

*   **The Layering Principle:** Use `surface-container-lowest` for background "wells" and `surface-container-highest` for items the user should touch. 
*   **The "Ghost Border":** If an element needs more definition (e.g., an input field), use `outline-variant` at 15% opacity. This creates a "shadow-gap" rather than a hard line.
*   **Tactile Beveling:** For buttons, do not use shadows. Use a 2-tone background: a lighter top half and a darker bottom half (using `primary` and `on-primary-container`) to simulate a carved 3D surface.

## 5. Components: The Inventory & Gear
Components must feel like "Items" found in a quest, not "Widgets" from a library.

*   **Buttons (The Plank/Stone):** 
    *   **Primary:** `primary` background. No rounded corners (`DEFAULT: 0px`). Use a "Carved" effect—a 2px bottom "lip" using `on-primary-fixed-variant`.
    *   **Secondary:** `surface-container-high` background. Feels like a heavy stone slab. 
*   **Progress Bars (The Mana Bar):** 
    *   Container: `surface-container-lowest`. 
    *   Fill: A horizontal gradient from `secondary` (Neon Emerald) to `on-secondary-container`. 
    *   *Interaction:* On "Level Up" (goal reached), the bar should flash `primary` (Gold).
*   **Cards (The Scrolls):** 
    *   Cards must use the `tertiary` (Parchment) token. 
    *   **Forbidden:** Divider lines. 
    *   **Required:** Use `24` (5.5rem) vertical padding between disparate content groups to allow the parchment texture to "breathe."
*   **Input Fields:** 
    *   Use `surface-container-lowest` (a "recessed" look). 
    *   The cursor should be a blinking block, mimicking retro terminal/RPG text boxes.
*   **Quest Chips:** 
    *   Small, rectangular blocks with `secondary` text for "Completed" or `error` for "Overspent."

## 6. Do's and Don'ts

### Do
*   **DO** use "Pixel-Dithering" gradients (stepped gradients) for large background transitions to lean into the 16-bit aesthetic.
*   **DO** treat icons as "Items." A "Savings Account" icon isn't a bank building; it's a `Chest`. "Insurance" is a `Shield`.
*   **DO** embrace the `0px` border radius. The system's personality comes from its sharp, pixel-perfect corners.

### Don't
*   **DON'T** use soft, rounded corners. It breaks the "Pixel" logic.
*   **DON'T** use pure black or grey. Every "neutral" must be tinted with Purple (`#1a063b`) to keep the atmosphere "Cozy."
*   **DON'T** use standard Material or FontAwesome icons. Every icon must be a custom 16-bit or 32-bit pixel asset to maintain the "High-End Custom" feel.
*   **DON'T** overcrowd the screen. RPGs have "Information Density," but Editorial design has "Luxury of Space." Balance the two.