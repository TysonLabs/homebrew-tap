class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.3.91"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.91/lazyide-macos-aarch64.tar.gz"
      sha256 "f8348bea7e20ec17e17af07868bd1856649e3a80c032e4f0c4e0898a9ee72959"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.91/lazyide-macos-x86_64.tar.gz"
      sha256 "f3f61b66c524e4fd44b1325294dd8428e918800ce05db5831952843d2878c910"
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
