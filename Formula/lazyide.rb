class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.3.93"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.93/lazyide-macos-aarch64.tar.gz"
      sha256 "62ec94482fd32dd6c42f5b08e57b5d2a63e52e56030997f641aef90ef494c353"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.93/lazyide-macos-x86_64.tar.gz"
      sha256 "68fe3ca694ef0d08de538c7aefd57faaa1132a89d23cf1977fa119f78125df74"
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
