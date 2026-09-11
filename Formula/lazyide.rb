class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.3.92"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.92/lazyide-macos-aarch64.tar.gz"
      sha256 "6a0a75df09a34dd6cb7496f2bc30106a201fb43d73b75159f3ae79e8333f928e"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.92/lazyide-macos-x86_64.tar.gz"
      sha256 "c631166d8898540afd685bb26327c12dcb2dafbc56617b7df9ac58c3a68be31d"
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
