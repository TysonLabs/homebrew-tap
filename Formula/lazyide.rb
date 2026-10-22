class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.4.0/lazyide-macos-aarch64.tar.gz"
      sha256 "126ddb6241fb9e8420b1f52ef813d42f12cd991458362f09e2b3d12cd24f1bca"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.4.0/lazyide-macos-x86_64.tar.gz"
      sha256 "4fa567329eb6f714bd00d1eed39bf43da496badc3fb5e653bc11fb533cfe54b9"
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
