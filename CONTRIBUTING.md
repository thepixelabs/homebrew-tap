# Contributing to thepixelabs/homebrew-tap

This tap is updated automatically. Most changes should never be made by hand.

## Adding a new app

1. In the source repo (e.g. `thepixelabs/newapp`):
   - Set up GitHub Releases with a signed, notarized `.dmg` (Cask) or a
     tagged release tarball (Formula).
   - Copy `.github/templates/homebrew-release.yml` from this repo into
     `.github/workflows/homebrew-release.yml`.
   - Replace `<APP_NAME>` with your app name.
   - Add the `HOMEBREW_TAP_TOKEN` secret (ask devops for the GitHub App
     installation token).

2. In this repo:
   - Add `thepixelabs/newapp` to the allowlist in `.github/workflows/accept-bump.yml`.
   - Manually create the first `Casks/newapp.rb` or `Formula/newapp.rb`
     file (subsequent updates will be automated).

3. Open a PR. CI runs `brew audit --strict --online` on the new file.
   Once merged, `update-readme.yml` regenerates the catalog table.

## Hand-editing a formula or cask

Don't, unless you are:
- Fixing a broken auto-bump.
- Adding `zap` paths, `depends_on`, `livecheck` rules, or other metadata
  that the auto-bump can't express.
- Deprecating an app.

If you must hand-edit, **also update the template generator** in the source
repo's release workflow, otherwise your change will be overwritten on the
next release.

## Running checks locally

```bash
brew tap --force thepixelabs/tap $(pwd)
brew audit --strict --online Casks/<name>.rb
brew style Casks/<name>.rb
brew install --cask thepixelabs/tap/<name>  # smoke test
```
