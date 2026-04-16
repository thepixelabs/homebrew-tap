class Uplnk < Formula
  desc "Terminal-native AI chat client — local-first, privacy-first"
  homepage "https://github.com/thepixelabs/uplnk"
  version "1.4.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.4.3/uplnk-darwin-arm64"
      sha256 "ca5fca3eedc47ca6d7fb093d664c5207f4662d085cc75b34faf1fb6ca22457f3"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.4.3/uplnk-darwin-x64"
      sha256 "4f09231d6925814fb1d4c37edc37c45fcfbdfa13ec47af3a6101346a61544e03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.4.3/uplnk-linux-arm64"
      sha256 "5eeda793775d9254047bea7aeb345570d926ca6f7b031de3247cdb66dc9982ee"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.4.3/uplnk-linux-x64"
      sha256 "692e5e8150cf36df10d81a601eb1e9921ca1dbdeb0276271f566c664757746e0"
    end
  end

  def install
    if OS.mac?
      bin.install (Hardware::CPU.arm? ? "uplnk-darwin-arm64" : "uplnk-darwin-x64") => "uplnk"
    else
      bin.install (Hardware::CPU.arm? ? "uplnk-linux-arm64" : "uplnk-linux-x64") => "uplnk"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uplnk --version")
  end
end
