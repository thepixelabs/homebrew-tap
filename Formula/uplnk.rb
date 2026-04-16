class Uplnk < Formula
  desc "Terminal-native AI chat client — local-first, privacy-first"
  homepage "https://github.com/thepixelabs/uplnk"
  version "1.5.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.5.0/uplnk-darwin-arm64"
      sha256 "0604ed18694fd382241d0588df900086cfecb3e827c2c22f1f329adae90e133c"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.5.0/uplnk-darwin-x64"
      sha256 "ce0c9af3c6d3756d500058e26524c7e472d0085fe403e3fa9553f8e8445f06ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.5.0/uplnk-linux-arm64"
      sha256 "a2eab29d6fb3f791c2b8175840143089c30a507322c5b075d71a1fef5dccf1c6"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.5.0/uplnk-linux-x64"
      sha256 "5a8ecd4174e732ae3b63e4e4ee8ac9894acd1c802b0b7d00da2054039a2a6095"
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
