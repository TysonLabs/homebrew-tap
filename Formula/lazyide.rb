class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.3.90"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.90/lazyide-macos-aarch64.tar.gz"
      sha256 "0a9a1cc5325ec730bb1df26be8b7456a2e499c9fb70e9dc9ac1dbf0d3f6f7c6a"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.90/lazyide-macos-x86_64.tar.gz"
      sha256 "790ae17316321060c0cfde2367acd13898006ab7c436598c801cc2b085fb72d7"
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
