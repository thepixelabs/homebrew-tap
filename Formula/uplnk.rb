class Uplnk < Formula
  desc "Terminal-native AI chat client — local-first, privacy-first"
  homepage "https://github.com/thepixelabs/uplnk"
  version "1.6.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.6.0/uplnk-darwin-arm64"
      sha256 "b17c3f0b00b180142f172ec3c952b3f93a35d40633bd9b7f2e13f75d4aa27075"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.6.0/uplnk-darwin-x64"
      sha256 "774eb762abd60bf4bb26438805f4c56e0b76ae72f4b7e1e2460a5b111ec9adec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.6.0/uplnk-linux-arm64"
      sha256 "cf25796539824f172203adee0c40933da47302947d3f744bc3b37a7d9e113624"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.6.0/uplnk-linux-x64"
      sha256 "67bc56525c0c9102f3409cfe5b3d6a0531cd0ca4059a06bccf4f52fc4f378b76"
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
