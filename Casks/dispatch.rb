cask "dispatch" do
  version "1.34.1"
  sha256 "a81c83bcb03735107e7a7f3df6124a341cc2faf5edf45c514c7af5f0302c7fb0"

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
