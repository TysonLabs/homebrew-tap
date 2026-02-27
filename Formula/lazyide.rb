class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.84"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.84/lazyide-macos-aarch64.tar.gz"
      sha256 "bf27a6fcf5e9e25e63fb1b4741ecf2027ae48b629e02b2c34f7d910c54dc671d"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.84/lazyide-macos-x86_64.tar.gz"
      sha256 "c0fc15507c3d20735ed3f07199de96e402406559d25da343dd5d33bf593f3bd6"
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
