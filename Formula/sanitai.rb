class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.0/sanitai-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "a7a651582fea7830d5701f40fc62f44ff1112931695acded0e43893f9237f25d"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.0/sanitai-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "9e1d2d97070dc54d39baf6d2e607e8a4e0761e94ba78558a03c14cec996b0ed7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.0/sanitai-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5693de78ed7bbaa1cf5bc6fe9fc83e9f7a2a840fee2c165aa5825d94b7403d9f"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.0/sanitai-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce93c71d09ae4c63d330e92a60fdd4ad510b29d05c19255e79cb898a407289e6"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
