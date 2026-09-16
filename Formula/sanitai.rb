class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.5.0/sanitai-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "8f98d34a218481525d38a6f060360f958c95d8c2499210d226e1c7db8e030d18"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.5.0/sanitai-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "6379800471415c7024a4366f87781306165e7487add6018564d2e1349e5b10f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.5.0/sanitai-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38a4ca263bb0aaa569e733ccc835a02c0ae06608b4092b0eaed2923c89a6806c"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.5.0/sanitai-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d0ee4373a1f5789af23edfc96d0c0e99ed4b1c0e0d852e180df3e73279e0dda"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
