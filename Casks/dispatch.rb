cask "dispatch" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/thepixelabs/dispatch/releases/download/v#{version}/Dispatch-#{version}-universal.dmg"
  name "Dispatch"
  desc "Local-first AI agent orchestrator — monitors Claude Code, Codex, Gemini CLI, and Copilot from one dashboard"
  homepage "https://github.com/thepixelabs/dispatch"

  app "Dispatch.app"

  zap trash: [
    "~/Library/Application Support/dispatch",
    "~/Library/Preferences/com.thepixelabs.dispatch.plist",
  ]
end
