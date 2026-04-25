cask "dispatch" do
  version "1.54.0"
  sha256 "68aa0338aa7faa2f4017ed098cebfff12af0831838ff8027d2771551034d0c79"

  url "https://github.com/thepixelabs/dispatch/releases/download/v#{version}/Dispatch-#{version}-arm64.dmg"
  name "Dispatch"
  desc "Local-first AI agent monitor for Claude, Codex, Gemini, and Copilot"
  homepage "https://github.com/thepixelabs/dispatch"

  depends_on macos: ">= :monterey"

  app "Dispatch.app"

  zap trash: [
    "~/Library/Application Support/dispatch",
    "~/Library/Preferences/com.thepixelabs.dispatch.plist",
  ]
end
