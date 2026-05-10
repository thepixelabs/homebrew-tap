class Rover < Formula
  desc "Terminal UI for the Dispatch multi-agent platform (rover-tui)"
  homepage "https://github.com/thepixelabs/rover"
  url "https://files.pythonhosted.org/packages/30/90/56f2e46eee6c05a3f618ef80a54d55b85af1612b74fe92f6cc57c2742e4d/rover_tui-0.3.8.tar.gz"
  sha256 "63771e785789f047a5963b95a95e8cf93ab0a535467eca21e807ab2b01bd638c"
  license :cannot_represent

  livecheck do
    url "https://pypi.org/pypi/rover-tui/json"
    strategy :json do |json|
      json.dig("info", "version")
    end
  end

  # Install via uv (a single Rust binary) rather than via Language::Python::Virtualenv.
  # uv brings its own Python from python-build-standalone (statically linked, no system
  # libexpat coupling), which insulates rover from Homebrew's bottle drama — including the
  # macOS Tahoe libexpat ABI break that affects every brewed python@3.X bottle, and the
  # occasional rebottle regressions that drop pip from a Python keg's site-packages.
  depends_on "uv"

  def install
    # Keep all uv state inside the keg so brew owns its lifecycle. only-managed forces
    # uv to ignore any Homebrew Python entirely and provision its own from
    # python-build-standalone. UV_NO_CACHE keeps the build reproducible.
    ENV["UV_PYTHON_INSTALL_DIR"] = "#{libexec}/uv-python"
    ENV["UV_TOOL_DIR"]           = "#{libexec}/uv-tools"
    ENV["UV_TOOL_BIN_DIR"]       = "#{libexec}/bin"
    ENV["UV_NO_CACHE"]           = "1"
    ENV["UV_PYTHON_PREFERENCE"]  = "only-managed"

    system Formula["uv"].opt_bin/"uv", "tool", "install",
           "--python", "3.12",
           "rover-tui==#{version}"

    bin.install_symlink libexec/"bin/rover"
  end

  def caveats
    <<~EOS
      rover requires tmux to manage terminal sessions. If you don't have it:
        brew install tmux

      To start rover:
        rover
    EOS
  end

  test do
    system bin/"rover", "--version"
  end
end
