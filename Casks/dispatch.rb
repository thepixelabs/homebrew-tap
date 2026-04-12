cask "dispatch" do
  version "1.24.0"
  sha256 "8afbc2221c3ac56480fd4617009b345d9b4df95a65ba1a85f7864357b31516dd"

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
