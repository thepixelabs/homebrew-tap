class Sanitai < Formula
  desc "Find secrets in your LLM chat history before someone else does"
  homepage "https://sanitai.pixelabs.net"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.1/sanitai-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "b3035284fabde9f334824ee458044f544f5026b28f260870637c0b9e0298e20f"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.1/sanitai-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "f2e1631adcd4076f7e570f782802768c3e4d751a9e23d5f5b8c31404fadb3ac6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.1/sanitai-0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ee7b50a4150de447d51730ffd2c10efc9d885b3982d5e9d802291ef94503b93"
    else
      url "https://github.com/thepixelabs/sanitai/releases/download/v0.4.1/sanitai-0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28645acda1a08c37c04ef50210fe90420b504062f67cb3e13f0d6aa70aabe573"
    end
  end

  def install
    bin.install "sanitai"
  end

  test do
    system bin/"sanitai", "--version"
  end
end
