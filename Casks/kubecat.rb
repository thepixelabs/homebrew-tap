cask "kubecat" do
  version "0.2.2"
  sha256 "cca216c43831840d4c59b0237e2db0924d0153903ddab98c208dd7f6e4047ea0"

  url "https://github.com/thepixelabs/kubecat/releases/download/v0.2.2/kubecat_v0.2.2_macOS_universal.dmg",
      verified: "github.com/thepixelabs/kubecat"
  name "Kubecat"
  desc "Incident-first Kubernetes desktop app with AI-powered operations"
  homepage "https://kubecat.io"

  livecheck do
    url :url
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
