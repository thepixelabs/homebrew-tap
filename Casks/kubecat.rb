cask "kubecat" do
  version "0.1.4"
  sha256 "931202432459619526d9cd0a40df28437d59fbcaf66091232287f561ec96f7b1"

  url "https://github.com/thepixelabs/kubecat/releases/download/v0.1.4/kubecat_v0.1.4_macOS_universal.dmg"
  name "Kubecat"
  desc "Incident-first Kubernetes desktop app with AI-powered operations"
  homepage "https://kubecat.io"

  livecheck do
    url "https://github.com/thepixelabs/kubecat/releases/download/v0.1.4/kubecat_v0.1.4_macOS_universal.dmg"
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
