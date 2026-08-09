Neumorphic Design System — Soft Tactile Theme
===========================================

This folder provides a standalone, framework-agnostic neumorphic design system inspired by the provided reference.

Purpose
- Create centralized design tokens (CSS variables) and a small CSS utility layer that you can drop into an existing project to apply the "Soft Neumorphic / Tactile Developer Dashboard" theme.
- Offer example markup in `demo.html` to preview the look and to guide integration.

Files
- `tokens.css` — centralized CSS variables (colors, spacing, radii, shadows).
- `neumorphic.css` — component styles (surface, cards, buttons, inputs, sidebar, profile, repo cards, responsive rules).
- `demo.html` — minimal HTML demo showing how to apply the theme to existing dashboard markup.

Integration guide
1. Copy `design-system/tokens.css` and `design-system/neumorphic.css` into your project (for example to `src/styles/`).
2. Import the tokens first, then the neumorphic CSS into your global stylesheet or main entry (for React: `index.css` or `App.css`, for plain HTML: include both in the `<head>`).
3. Without changing your markup, add the relevant utility classes where you want the visual treatment (see comments in `neumorphic.css`).

Notes
- This design system changes only visual presentation. It is purposely delivered as pure CSS so you can keep all existing JS, API calls, and templates unchanged.
- If your project uses a CSS-in-JS solution, the tokens.css variables can be converted to theme values in that system.

Design goals
- Warm cream background, soft off-white surfaces
- Raised and inset neumorphic surfaces
- Deep teal accent for primary actions and highlights
- Soft, diffused shadows and subtle hover/pressed states

If you want, I can adapt these files specifically to a framework (React, Next.js, Vue) and inject classes into your components — tell me the framework and the root path.
