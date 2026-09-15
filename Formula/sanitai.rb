class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.3/sanitai-0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "d2981e353ee2df61c8b5fc853c1f2b286165e3d4bbf34aae1eec7b156dcc747a"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.3/sanitai-0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "3a57676be56d13a7826bbcae23f3acb97436fa5c27f08c04b09d843eae17e36a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.3/sanitai-0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49fb079365500daa62aaf1093dc58a68b14a9ce29a0d5958d9ea6b5b703c9619"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.3/sanitai-0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52f25a566752b818dd156e4bb5f5770b320df19583431c3351cd61c783b1c2e8"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
