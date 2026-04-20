cask "kubecat" do
  version "0.1.3"
  sha256 "92e529e6949fba7dcac06e0758d6ca02c2e3218edf39ab3bf44d868fae3bdce3"

  url "https://github.com/thepixelabs/kubecat/releases/download/v0.1.3/kubecat_v0.1.3_macOS_universal.dmg"
  name "Kubecat"
  desc "Incident-first Kubernetes desktop app with AI-powered operations"
  homepage "https://kubecat.io"

  livecheck do
    url "https://github.com/thepixelabs/kubecat/releases/download/v0.1.3/kubecat_v0.1.3_macOS_universal.dmg"
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
