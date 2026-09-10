class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.3.88"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.88/lazyide-macos-aarch64.tar.gz"
      sha256 "e7a5174647c38dd58316f8c2ef4522e4cadbfb0cf931026f6455b33be3030324"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.88/lazyide-macos-x86_64.tar.gz"
      sha256 "74572783906badb658253b9c7b1752c9f683df7c51dcae85cbe98bd3736800ba"
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
