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
| dispatch | Cask | 1.31.1 | Local-first AI agent monitor for Claude, Codex, Gemini, and Copilot | `brew install --cask thepixelabs/tap/dispatch` |
| kubecat | Cask | 0.3.1 | Incident-first Kubernetes desktop app with AI-powered operations | `brew install --cask thepixelabs/tap/kubecat` |
| amnesiai | Formula | 1.0.5 | git your ai setup — backup and restore AI coding assistant configurations | `brew install thepixelabs/tap/amnesiai` |
| sanitai | Formula | 0.2.10 | Find secrets in your LLM chat history before someone else does | `brew install thepixelabs/tap/sanitai` |
| uplnk | Formula | 1.5.0 | Terminal-native AI chat client — local-first, privacy-first | `brew install thepixelabs/tap/uplnk` |

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

Apache 2.0. Individual formulas/casks reference their own upstream licenses.
