cask "dispatch" do
  version "1.27.2"
  sha256 "8815b557c467079379a089c469a33d36bd5b10318bdb2fe08340146fa297fc02"

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
