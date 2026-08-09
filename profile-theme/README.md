# Themed Profile Preview

This folder contains a standalone, themed preview of the repository README using the "Soft Neumorphic / Tactile Developer Dashboard" design system.

How it works
- `index.html` loads `../README.md` and renders it client-side using `marked.js`.
- Visual styling is provided by the shared design system located at `../design-system/tokens.css` and `../design-system/neumorphic.css`.

Preview locally
1. Open `profile-theme/index.html` in your browser (double-click or serve with a static server).
2. The page will fetch the local `README.md` and render it inside a neumorphic layout.

Publish to GitHub Pages
- Move `profile-theme` contents to a branch or configure Pages to publish from the repository root. The design-system files are referenced relatively so keep the directory structure as-is.

Notes
- This preview preserves the README content exactly and adds the neumorphic visual presentation and subtle animations. It does not modify any API or dynamic data.
