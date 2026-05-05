class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.0/sanitai-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "e371f89f1f3fd60364d976034fcbe6c5a50021c3e10ca101002678ccd00b39bd"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.0/sanitai-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "da6930ef0e21181dd82fa7ad75b0d15e0cb15af5b61375e44c314e79a9870523"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.0/sanitai-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49104a72b8b5b512114a61f4de380b7aa368eff73fefbd38635f49f61ad6b3ce"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.0/sanitai-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b7cf033b0631ebbd672a4d892311eb6dee5821daa2c32d7639208feec9fdba8"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
