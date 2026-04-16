class Uplnk < Formula
  desc "Terminal-native AI chat client — local-first, privacy-first"
  homepage "https://github.com/thepixelabs/uplnk"
  version "PLACEHOLDER_VERSION"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "PLACEHOLDER_URL_DARWIN_ARM64"
      sha256 "PLACEHOLDER_SHA_DARWIN_ARM64"

      def install
        bin.install "uplnk-darwin-arm64" => "uplnk"
      end
    end
    on_intel do
      url "PLACEHOLDER_URL_DARWIN_X64"
      sha256 "PLACEHOLDER_SHA_DARWIN_X64"

      def install
        bin.install "uplnk-darwin-x64" => "uplnk"
      end
    end
  end

  on_linux do
    on_arm do
      url "PLACEHOLDER_URL_LINUX_ARM64"
      sha256 "PLACEHOLDER_SHA_LINUX_ARM64"

      def install
        bin.install "uplnk-linux-arm64" => "uplnk"
      end
    end
    on_intel do
      url "PLACEHOLDER_URL_LINUX_X64"
      sha256 "PLACEHOLDER_SHA_LINUX_X64"

      def install
        bin.install "uplnk-linux-x64" => "uplnk"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uplnk --version")
  end
end
RUBY

# Substitute placeholders with actual values. Using | as the sed
# delimiter avoids conflicts with / in URLs.
sed -i \
  -e "s|PLACEHOLDER_VERSION|${VERSION}|g" \
  -e "s|PLACEHOLDER_URL_DARWIN_ARM64|${URL_DARWIN_ARM64}|g" \
  -e "s|PLACEHOLDER_SHA_DARWIN_ARM64|${SHA_DARWIN_ARM64}|g" \
  -e "s|PLACEHOLDER_URL_DARWIN_X64|${URL_DARWIN_X64}|g" \
  -e "s|PLACEHOLDER_SHA_DARWIN_X64|${SHA_DARWIN_X64}|g" \
  -e "s|PLACEHOLDER_URL_LINUX_ARM64|${URL_LINUX_ARM64}|g" \
  -e "s|PLACEHOLDER_SHA_LINUX_ARM64|${SHA_LINUX_ARM64}|g" \
  -e "s|PLACEHOLDER_URL_LINUX_X64|${URL_LINUX_X64}|g" \
  -e "s|PLACEHOLDER_SHA_LINUX_X64|${SHA_LINUX_X64}|g" \
  Formula/uplnk.rb
