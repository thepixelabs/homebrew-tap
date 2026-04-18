class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v#{version}/sanitai-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e9c8889a945698b66fb1a6fb1f563023914b1f97210b9d79e9854e16eeffc646"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v#{version}/sanitai-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8d31e66b43d7ad611873c292daa9fe0ef5f62b56453d28b5b4610e4b5389bb04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v#{version}/sanitai-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90311af9a998dbbf5cb4023313be22da04fc88bce4ef9fa57819898e298d9f47"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v#{version}/sanitai-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57e29bb4f1192868e06decb9f21397f9f4158047cff39ff6140f133207ebd7ca"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
