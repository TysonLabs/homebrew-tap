class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.82"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.82/lazyide-macos-aarch64.tar.gz"
      sha256 "cdd0ca63090e2b74a11b4a2c7b490d7a403539593b270bc04f3498d531e59700"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.82/lazyide-macos-x86_64.tar.gz"
      sha256 "09fc99473e61e89916a0dbb8a1f27423a7f555f626fb00e8cb4800af27fabc5d"
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
