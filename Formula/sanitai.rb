class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.1/sanitai-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "3a482a89c70f5cd50caa7bdddd5ce3355dbc09d31280de8570e0675e4e8d01fb"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.1/sanitai-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "2e9cdfaee4f4949739acd557f9d0bceacad42bf063f35df439bd035f0d1c4fa9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.1/sanitai-0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4bcd2c05e4652a66f1528465028061e6a6848a0347c2c3143cde8a67e0a859bd"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.1/sanitai-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57afa878d9b031f7e70ecf8bfda71ca74b7931d6bee5f0f77f0c21abefbf199e"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
