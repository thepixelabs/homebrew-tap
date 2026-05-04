cask "kubecat" do
  version "0.2.1"
  sha256 "1a48fb96248b08a947d31e7c15ebfc12e928f9cabc9ead13721043a2b7d76025"

  url "https://github.com/thepixelabs/kubecat/releases/download/v0.2.1/kubecat_v0.2.1_macOS_universal.dmg"
  name "Kubecat"
  desc "Incident-first Kubernetes desktop app with AI-powered operations"
  homepage "https://kubecat.io"

  livecheck do
    url "https://github.com/thepixelabs/kubecat/releases/download/v0.2.1/kubecat_v0.2.1_macOS_universal.dmg"
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Kubecat.app"

  zap trash: [
    "~/.config/kubecat",
    "~/Library/Application Support/kubecat",
    "~/Library/Caches/kubecat",
    "~/Library/Preferences/com.kubecat.plist",
    "~/Library/Saved Application State/com.kubecat.savedState",
  ]
end
