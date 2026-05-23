class RoverTui < Formula
  desc "SSH-friendly TUI session manager and AI agent launcher for your Mac"
  homepage "https://github.com/thepixelabs/rover"
  url "https://files.pythonhosted.org/packages/59/3b/fd9cbf15563282b0a1dac9eda048f899d3d484a461731e4fcc4aae63023b/rover_tui-0.4.0.tar.gz"
  sha256 "0e290f3efa8ae073539f887030eb6e4b812b822367b4d06b2eb485939b133ee0"
  license "Apache-2.0"

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

      Auto-launch on SSH login — run this once, then reload your shell:

        echo 'if [[ -n "$SSH_CONNECTION" ]] && [[ -z "$TMUX" ]] && command -v rover >/dev/null 2>&1; then exec rover; fi' >> ~/.zshrc
        source ~/.zshrc
    EOS
  end

  test do
    system bin/"rover", "--version"
  end
end
