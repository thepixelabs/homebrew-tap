class Uplnk < Formula
  desc "Terminal-native AI chat client — local-first, privacy-first"
  homepage "https://github.com/thepixelabs/uplnk"
  version "1.6.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.6.2/uplnk-darwin-arm64"
      sha256 "926417340732e7f8e854b81243164bd2689a83e746cb9cbb5febafe01badc1ef"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.6.2/uplnk-darwin-x64"
      sha256 "60cd7d917c6d742fa8934492fe1471e0804a232a44192090eb535a9ef553626a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.6.2/uplnk-linux-arm64"
      sha256 "2b89c38332c5d6d7cba26071acaacfdd58b13ceda45db79e7261549815e32110"
    end
    on_intel do
      url "https://github.com/thepixelabs/uplnk/releases/download/v1.6.2/uplnk-linux-x64"
      sha256 "d6d26c69527f085eedc8d6423ee3e56179681b007fade6bb7288968a50b12f15"
    end
  end

  def install
    if OS.mac?
      bin.install (Hardware::CPU.arm? ? "uplnk-darwin-arm64" : "uplnk-darwin-x64") => "uplnk"
    else
      bin.install (Hardware::CPU.arm? ? "uplnk-linux-arm64" : "uplnk-linux-x64") => "uplnk"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uplnk --version")
  end
end
