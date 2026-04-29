class Vedox < Formula
  desc "Local-first, Git-native documentation operating system for solo developers"
  homepage "https://vedox.pixelabs.net"
  license :cannot_represent

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/thepixelabs/Vedox/releases/download/v0.1.0-alpha.2/vedox-0.1.0-alpha.2-darwin-universal.zip"
      sha256 "f9233ec251da0263d7f3849edd39563dc8b587e3ac40cd9cd6122229052f66cb"
    end
    on_intel do
      url "https://github.com/thepixelabs/Vedox/releases/download/v0.1.0-alpha.2/vedox-0.1.0-alpha.2-darwin-universal.zip"
      sha256 "f9233ec251da0263d7f3849edd39563dc8b587e3ac40cd9cd6122229052f66cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thepixelabs/Vedox/releases/download/v0.1.0-alpha.2/vedox-0.1.0-alpha.2-linux-arm64.tar.gz"
      sha256 "2b5c275d78ac4cf4f7c900f752901504ec31d614ecb07d1da1b0737acac89803"
    end
    on_intel do
      url "https://github.com/thepixelabs/Vedox/releases/download/v0.1.0-alpha.2/vedox-0.1.0-alpha.2-linux-amd64.tar.gz"
      sha256 "8410b67a0dd468de93b485e72b665073225ab8cfadc0bb64315b4fa5378629e1"
    end
  end

  service do
    run [opt_bin/"vedox", "server"]
    keep_alive true
    log_path var/"log/vedox.log"
    error_log_path var/"log/vedox.error.log"
  end

  def install
    bin.install "vedox"
    generate_completions_from_executable(bin/"vedox", "completion")
  end

  test do
    assert_match "vedox", shell_output("#{bin}/vedox version")
  end
end
