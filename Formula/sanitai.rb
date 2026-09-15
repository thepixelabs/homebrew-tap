class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.2/sanitai-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "90b1293e1b8e5f728042ee0899ef4a89e1d6dd63513fda24a77395be7f81a29b"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.2/sanitai-0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "c0f78ef55f0fa95dd0e38fc8a40465a32489227cb490918523bef316d4dd74b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.2/sanitai-0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99bdb7287bfdfab44dac79724bf2a15a07e2d903e342212b3498067d8e9511dc"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.2/sanitai-0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c615382bf0681d848010907b8853695b1c54e3109ca726d273f009f30f42dfa"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
