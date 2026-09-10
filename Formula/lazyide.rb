class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.3.89"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.89/lazyide-macos-aarch64.tar.gz"
      sha256 "40087a75ed5e14301396a1ccdacc96fd6dfd29752df107cb2f90751ef86f7a90"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.89/lazyide-macos-x86_64.tar.gz"
      sha256 "04464673654331a15125d3b0eee6bbbe24b3b8aca4e13c704d55bdfd98529029"
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
