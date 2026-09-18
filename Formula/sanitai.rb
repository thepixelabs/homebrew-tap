class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.5.1/sanitai-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "2536e16bee26e9077e371128236d0684ce1528a5ccd684c229723b07be1ac5fe"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.5.1/sanitai-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "8ee4ef669aac1d16385f9638f9cde703ff58d5ef742226fb6f6eb35d7f4633b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.5.1/sanitai-0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b70981fa7699c54e580184ad73fe23ba901465b7abaa65c9193095061d86f253"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.5.1/sanitai-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0748760830368c748c62721934c8b453753034a1903d2adf88680f715021fb41"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
