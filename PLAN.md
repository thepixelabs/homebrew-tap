# Homebrew Tap — Multi-App Distribution Plan

**Owner (proposed):** release-engineer (new role) or devops
**Created:** 2026-04-10
**Status:** DRAFT — awaiting approval

## Goal

Consolidate all Pixel Labs Homebrew distribution into a single tap repo:
`thepixelabs/homebrew-tap`. This replaces the current one-repo-per-app pattern
(`thepixelabs/homebrew-kubecat`) with a scalable multi-app tap that can host
dispatch, kubecat, and all future apps under one install namespace:

```bash
brew install --cask thepixelabs/tap/dispatch
brew install --cask thepixelabs/tap/kubecat
brew install        thepixelabs/tap/<future-cli>
```

## Why a single tap

- **User UX:** one `brew tap thepixelabs/tap` gets the whole catalog.
- **Cross-promotion:** `brew search thepixelabs/tap` discovers siblings.
- **Fewer repos to maintain:** one CI pipeline, one README, one audit workflow.
- **Coexistence of Casks and Formulas:** Homebrew supports both in the same
  tap under `Casks/` and `Formula/` directories.

## Repo layout

```
thepixelabs/homebrew-tap/
├── README.md                         # auto-generated catalog table
├── CONTRIBUTING.md                   # how to add a new app
├── LICENSE                           # Apache 2.0
├── Formula/                          # CLI / headless tools
│   └── (future)
├── Casks/                            # desktop apps
│   ├── dispatch.rb                   # new — v1.18.0+
│   └── kubecat.rb                    # migrated from homebrew-kubecat
├── assets/                           # logos for README only
│   ├── dispatch-logo.png
│   └── kubecat-logo.png
└── .github/
    └── workflows/
        ├── ci.yml                    # brew audit + brew test-bot on PRs
        ├── update-readme.yml         # regenerate catalog table on push to main
        └── accept-bump.yml           # auto-merge trusted version-bump PRs
```

## Phase 1 — Scaffold tap repo (this plan)

**Owner:** devops (or release-engineer if hired)

**Deliverables:**
1. `README.md` with catalog table placeholder (DONE in this scaffold)
2. `CONTRIBUTING.md` — template for adding a new formula/cask
3. `LICENSE` — Apache 2.0
4. `.github/workflows/ci.yml` — runs on every PR:
   - `brew tap --force thepixelabs/tap ./`
   - `brew audit --strict --online Formula/*.rb Casks/*.rb`
   - `brew style`
   - (macOS runner only)
5. `.github/workflows/update-readme.yml` — regenerates the "Available" table
   by parsing `name`/`desc`/`version` fields from every `.rb` file on push to main.
6. Create empty `thepixelabs/homebrew-tap` GitHub repo, push scaffold.
7. Verify `brew tap thepixelabs/tap` works against the empty tap.

**Done when:** `brew tap thepixelabs/tap && brew audit --strict` passes on an empty tap.

## Phase 2 — Ship dispatch as a Cask

**Owner:** devops + dispatch release owner

**Deliverables:**

### In `thepixelabs/dispatch`:
1. **Electron build pipeline** — `electron-builder` config producing a
   universal `.dmg` (`Dispatch-<version>-universal.dmg`) as a GitHub Release
   asset. This may already exist for the v1.18.0 tray app — verify before building.
2. **Code signing + notarization** — Apple Developer ID cert in GitHub
   secrets, `notarytool` step in the release workflow. *Required* for Cask;
   an unsigned `.dmg` will be gatekeeper-blocked and brew will surface the
   error to every user.
3. **`.github/workflows/homebrew-release.yml`** — triggers on
   `release: published`, computes the `.dmg` sha256, opens a PR against
   `thepixelabs/homebrew-tap` updating `Casks/dispatch.rb` with the new
   `version` + `sha256` + `url`. Uses a fine-grained PAT or GitHub App token
   scoped to `homebrew-tap` only.

### In `thepixelabs/homebrew-tap`:
1. **`Casks/dispatch.rb`** — initial Cask pointing at the first signed
   release. Template:
   ```ruby
   cask "dispatch" do
     version "1.18.0"
     sha256 "<sha256-of-dmg>"
     url "https://github.com/thepixelabs/dispatch/releases/download/v#{version}/Dispatch-#{version}-universal.dmg"
     name "Dispatch"
     desc "Multi-agent AI orchestration desktop app with menu-bar tray"
     homepage "https://github.com/thepixelabs/dispatch"
     livecheck do
       url :url
       strategy :github_latest
     end
     depends_on macos: ">= :big_sur"
     app "Dispatch.app"
     zap trash: [
       "~/.dispatch",
       "~/Library/Application Support/dispatch",
       "~/Library/Caches/dispatch",
       "~/Library/Logs/dispatch",
       "~/Library/Preferences/com.thepixelabs.dispatch.plist",
       "~/Library/Saved Application State/com.thepixelabs.dispatch.savedState",
     ]
   end
   ```
2. **CI passes** — `brew audit --strict --online Casks/dispatch.rb`

**Note — conflict with existing `.tasks/v1.18.0-docs/plan.md:97-100`:**
That plan proposes a **Formula** (`HomebrewFormula/dispatch.rb` with
`depends_on "node"`, libexec, wrapper scripts). This contradicts the "tray
app first" positioning — it would give brew users a node CLI while DMG
users get an Electron app. We recommend **superseding that section** with
this Cask-based approach. If a headless CLI is ever needed, add a Formula
alongside the Cask later; brew supports both.

**Done when:** `brew install --cask thepixelabs/tap/dispatch` installs and
launches Dispatch.app from a clean Mac, and README.md's "Install" section
resolves to a working single command.

## Phase 3 — Migrate kubecat into the tap

**Owner:** devops

**Deliverables:**

### In `thepixelabs/homebrew-tap`:
1. Copy `homebrew-kubecat/Casks/kubecat.rb` → `homebrew-tap/Casks/kubecat.rb` verbatim.
2. Copy `homebrew-kubecat/assets/kubecat-logo-small-white.png` → `homebrew-tap/assets/`.
3. README auto-regenerates catalog table with kubecat entry.

### In the source kubecat repo (wherever its releases live):
1. Add/update `homebrew-release.yml` to open PRs against
   `thepixelabs/homebrew-tap` instead of `thepixelabs/homebrew-kubecat`.

### In `thepixelabs/homebrew-kubecat` (old tap):
1. **Do not delete immediately.** Existing users have `brew tap thepixelabs/kubecat`
   pinned in their setup. Deleting breaks them.
2. **Deprecation path:** replace `Casks/kubecat.rb` with a stub that uses
   `deprecate!` + `caveats` pointing to the new tap:
   ```ruby
   cask "kubecat" do
     version :latest
     url "https://github.com/thepixelabs/homebrew-tap"
     name "Kubecat"
     desc "MOVED to thepixelabs/tap"
     homepage "https://github.com/thepixelabs/homebrew-tap"
     deprecate! date: "2026-04-10", because: "moved to thepixelabs/tap. Run: brew untap thepixelabs/kubecat && brew install --cask thepixelabs/tap/kubecat"
     app "Kubecat.app" # no-op, just to satisfy parser
   end
   ```
3. Update `homebrew-kubecat/README.md` with a migration notice at the top.
4. Archive the repo on GitHub after ~90 days.

**Done when:**
- `brew install --cask thepixelabs/tap/kubecat` works.
- Existing `thepixelabs/kubecat` tap users see a deprecation warning on
  their next `brew upgrade` pointing at the new command.

## Phase 4 — Multi-app CI/CD hardening

**Owner:** devops / release-engineer

Designed so adding app #3, #4, #N is a copy-paste.

**Deliverables in `thepixelabs/homebrew-tap`:**

1. **`ci.yml`** runs per-PR:
   - `brew audit --strict --online` on *changed* files only (faster CI as
     the catalog grows — use `git diff --name-only origin/main`).
   - `brew style` on all files.
   - For Casks that can be installed headless, optional
     `brew install --cask <changed>` smoke test in a macOS runner.

2. **`accept-bump.yml`** — auto-merge PRs labeled `version-bump` if:
   - Author is `github-actions[bot]` from a known source repo
     (allowlist: `thepixelabs/dispatch`, `thepixelabs/kubecat`, ...).
   - Only one file changed, and it's a `.rb` in `Formula/` or `Casks/`.
   - CI is green.
   - Diff touches only `version` / `sha256` / `url` lines (enforced via
     regex check).
   - Everything else → human review.

3. **`update-readme.yml`** — runs on push to main:
   - Parses every `.rb` file for `name`, `desc`, `version`, cask vs formula.
   - Regenerates the markdown table between the
     `<!-- AUTO-GENERATED -->` markers in `README.md`.
   - Commits back to main only if the table changed (use
     `peter-evans/create-pull-request` or a simple `git diff --quiet` guard).

4. **Secrets + token strategy:**
   - Create a single GitHub App `thepixelabs-homebrew-bot` with write access
     to `thepixelabs/homebrew-tap` only.
   - Each source repo (dispatch, kubecat, ...) stores the app's installation
     token as `HOMEBREW_TAP_TOKEN` secret.
   - Reason for a GitHub App instead of a PAT: PATs are tied to a person,
     expire, and grant more scope than needed. An App is tap-scoped and
     survives maintainer turnover.

5. **Per-source-repo release workflow template** — maintain in
   `thepixelabs/homebrew-tap/.github/templates/homebrew-release.yml` so new
   apps can copy it into their repo with a single sed replacement
   (`<APP_NAME>`).

## Phase 5 — Docs + cutover

**Owner:** tech-writer (Phase 1 of the existing v1.18.0-docs epic overlaps)

1. Update `thepixelabs/dispatch` README's install section from the hypothetical
   `brew install thepixelabs/tap/dispatch` to the real
   `brew install --cask thepixelabs/tap/dispatch` (note the `--cask` flag).
2. Update `QUICKSTART.md` similarly.
3. Add a short `docs/HOMEBREW.md` in dispatch explaining how the release
   flow works, so future maintainers understand the cross-repo plumbing.
4. Cross-link `homebrew-tap/README.md` → each app's homepage.

## Open questions (resolve before Phase 2)

1. **Does dispatch already have a signed/notarized `.dmg` build?** If not,
   Phase 2 is blocked on Apple Developer ID provisioning. This is often the
   slowest step — allow real calendar time for Apple.
2. **Tap name: `homebrew-tap` vs `homebrew-apps`?** `tap` is generic and
   timeless; `apps` reads nicer in the install command but lies if we ever
   add CLI Formulas. **Recommendation: `homebrew-tap`**. Matches hashicorp's
   convention.
3. **Does kubecat have active installs we'd break with migration?** If yes,
   Phase 3 deprecation path is mandatory. If zero users, we can delete the
   old tap outright. Check download stats on the old releases before choosing.
4. **Private vs public tap?** Must be public — `brew tap` against a private
   repo requires SSH and is a terrible UX. All formulas/casks here are
   effectively public.

## Non-goals

- Linux support (brew works on Linux but dispatch is macOS-only today).
- Windows (winget / scoop are separate future work, not in this plan).
- Publishing to `homebrew/core` (the official repo) — that's a much higher
  bar (notability requirements, maintainer review, stricter auditing). Stay
  in our own tap for now.
