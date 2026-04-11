cask "kubecat" do
  version "0.2.3"
  sha256 "ca022b0031e72fc7aaae5bcc92403bc980283c6c7f3b123872396ba6899009ac"

  url "https://github.com/thepixelabs/homebrew-kubecat/releases/download/v0.2.3/kubecat_v0.2.3_macOS_universal.dmg"
  name "Kubecat"
  desc "Incident-first Kubernetes desktop app with AI-powered operations"
  homepage "https://loquacious-pegasus-544122.netlify.app/"

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
