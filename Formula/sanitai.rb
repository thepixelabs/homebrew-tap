class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.2.11/sanitai-0.2.11-aarch64-apple-darwin.tar.gz"
      sha256 "e6ae56c1a2cb5e27fa54575ab81bfbc3d3d9fa7e60a15fa5f8c8867e839995f4"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.2.11/sanitai-0.2.11-x86_64-apple-darwin.tar.gz"
      sha256 "6fa1ea0e86414d561f80f11e7f9d60f24495d8790e59cbd541e67023be575c15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.2.11/sanitai-0.2.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "832b3f8c368fa606ec9264a3b5f7ab184e09682cc953c65a304047618a95dbeb"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.2.11/sanitai-0.2.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "daed1342b709ea8af219e52c6e06958e9a9ed9bc762e2cad8f0ec3d463d648c3"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
