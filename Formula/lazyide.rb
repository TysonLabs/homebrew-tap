class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.86"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.86/lazyide-macos-aarch64.tar.gz"
      sha256 "c3cb2bda0d541d64edd57effcf29975368b1655d1b0b909dd8155ed8d50d0d10"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.86/lazyide-macos-x86_64.tar.gz"
      sha256 "56f9114e563652e3ec0a7fee4b3ea6b3f9b5ee5d8d5e0e6dacc51a526527a8c1"
    end
  end

  def install
    bin.install "lazyide"
  end

  def caveats
    <<~EOS
      Optional tools for full functionality:
        brew install ripgrep        # project-wide search (Ctrl+Shift+F)
        rustup component add rust-analyzer  # LSP for Rust files

      Run `lazyide --setup` to check and install missing tools.
    EOS
  end

  test do
    assert_match "Usage: lazyide", shell_output("#{bin}/lazyide --help")
  end
end
