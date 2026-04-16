class Uplnk < Formula
  desc "Terminal-native AI chat client — local-first, privacy-first"
  homepage "https://github.com/thepixelabs/uplnk"
  version "1.4.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.4.4/uplnk-darwin-arm64"
      sha256 "8f4c67b68076a2accd9aa6b8a86882fd33d6699594ba03ae019249971986798b"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.4.4/uplnk-darwin-x64"
      sha256 "58cb12422966e685a4b138461124aa517e64a83ab1d608fa8d8811b50855ee0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.4.4/uplnk-linux-arm64"
      sha256 "78eb795580e3cfcd9f7fb04ec6411fcb3d58455d3cde568595c805507172d6e7"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.4.4/uplnk-linux-x64"
      sha256 "6b8ddee7552303163cf75c6cfc65f3011aae23ebbf1f2352ae60fe18495d4299"
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
