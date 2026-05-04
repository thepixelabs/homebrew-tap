cask "dispatch" do
  version "1.60.0"
  sha256 "271cbd9c3ddef21c6e197210b52100e3a00a63d16b878693fce7746f4354dd0d"

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
