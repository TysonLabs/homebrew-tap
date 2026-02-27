class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.8/lazyide-macos-aarch64.tar.gz"
      sha256 "c3debfcb921be2381c6a33fa9be21b1d1c01d479cb5ca137721b271cd12dd4fe"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.8/lazyide-macos-x86_64.tar.gz"
      sha256 "f114c9335648dccd3bb66431fa4cb1aef8cb2072b3a59a274d408bb9d77b2681"
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
