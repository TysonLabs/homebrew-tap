class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.81"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.81/lazyide-macos-aarch64.tar.gz"
      sha256 "d278152b3978464405f8c0a79ba991646f7a7ba935861a78807ae74ab0ced85b"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.81/lazyide-macos-x86_64.tar.gz"
      sha256 "a9c6cdcb02a8576dd738d22f71ebc194736c2259b62822038c8a08bdcb6b4a99"
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
