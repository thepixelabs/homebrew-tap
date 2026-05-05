class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.2/sanitai-0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "8d4f716babd29a05d73543fdc753fa79ef171b39154ebe83733e09d979781caa"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.2/sanitai-0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "5cb49e36c00affec5def1c6b6277c4406cef72ff605fe19599ff971ccc5139cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.2/sanitai-0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "789026cc23c01f7f395bf817f663351056125fff74eb63f1289f3c1d4d489b93"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.3.2/sanitai-0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "193f6cc0c692657cdbbacb9f0c7cf3902a9688a5ed06314855b2d3a37fc33081"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
