cask "dispatch" do
  version "1.18.1"
  sha256 "d807c5570ea60b0d3a47b2f5ba0649260ca0a2300e61690e230e4508d25f03ae"

  url "https://github.com/thepixelabs/dispatch/releases/download/v#{version}/Dispatch-#{version}-arm64.dmg"
  name "Dispatch"
  desc "Local-first AI agent orchestrator — monitors Claude Code, Codex, Gemini CLI, and Copilot from one dashboard"
  homepage "https://github.com/thepixelabs/dispatch"

  app "Dispatch.app"

  zap trash: [
    "~/Library/Application Support/dispatch",
    "~/Library/Preferences/com.thepixelabs.dispatch.plist",
  ]
end
