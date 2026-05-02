# 🍺 The Pixel Labs — Homebrew Tap

Official Homebrew tap for all applications from [The Pixel Labs](https://github.com/thepixelabs).

## Installation

```bash
brew tap thepixelabs/tap
```

## Available Formulas & Casks

<!-- AUTO-GENERATED: do not edit by hand, updated by .github/workflows/update-readme.yml -->

| Name | Type | Version | Description | Install |
|------|------|---------|-------------|---------|
| dispatch | Cask | 1.58.0 | Local-first AI agent monitor for Claude, Codex, Gemini, and Copilot | `brew install --cask thepixelabs/tap/dispatch` |
| kubecat | Cask | 0.1.3 | Incident-first Kubernetes desktop app with AI-powered operations | `brew install --cask thepixelabs/tap/kubecat` |
| amnesiai | Formula | 1.1.1 | git your ai setup — backup and restore AI coding assistant configurations | `brew install thepixelabs/tap/amnesiai` |
| rover | Formula |  | Terminal UI for the Dispatch multi-agent platform (rover-tui) | `brew install thepixelabs/tap/rover` |
| sanitai | Formula | 0.2.12 | Find secrets in your LLM chat history before someone else does | `brew install thepixelabs/tap/sanitai` |
| uplnk | Formula | 1.6.2 | Terminal-native AI chat client — local-first, privacy-first | `brew install thepixelabs/tap/uplnk` |
| vedox | Formula |  | Local-first, Git-native documentation operating system for solo developers | `brew install thepixelabs/tap/vedox` |

<!-- END AUTO-GENERATED -->

## One-line install

```bash
# Cask (desktop apps)
brew install --cask thepixelabs/tap/<name>

# Formula (CLI tools)
brew install thepixelabs/tap/<name>
```

## Contributing

This tap is updated automatically by release workflows in each source repository.
Do not hand-edit `Formula/*.rb` or `Casks/*.rb` — your changes will be overwritten
on the next release.

To add a new application to this tap, see [`CONTRIBUTING.md`](CONTRIBUTING.md).

## License

PolyForm Shield 1.0.0. Individual formulas/casks reference their own upstream licenses.
