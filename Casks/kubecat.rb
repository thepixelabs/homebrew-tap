cask "kubecat" do
  version "0.3.1"
  sha256 "d964e9ca4edef63e571cc14f63effca30cc6b5b71e2357fdf6f00f1604bf2830"

  url "https://github.com/thepixelabs/homebrew-kubecat/releases/download/v#{version}/kubecat_v#{version}_macOS_universal.dmg"
  name "Kubecat"
  desc "Incident-first Kubernetes desktop app with AI-powered operations"
  homepage "https://kubecat.io"

  livecheck do
    url "https://github.com/thepixelabs/kubecat/releases/latest"
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
