class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.2.12/sanitai-0.2.12-aarch64-apple-darwin.tar.gz"
      sha256 "f5399ab0396a8ddf5fdd882ac9f746cc07df13df2e1793d222a5b2f4e0e0a18a"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.2.12/sanitai-0.2.12-x86_64-apple-darwin.tar.gz"
      sha256 "e3822bb8cb76b95daca0c31de1d6078274e652c11093541a48e9b529503bca97"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.2.12/sanitai-0.2.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72a3638236268de6a01ffe98405377d62fd9536f32a4c2b5819c58815da5624f"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.2.12/sanitai-0.2.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ada1aeefd462cd4fae858748fbfe2e3341b1a90a29f509048f364f2ad62708d8"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
