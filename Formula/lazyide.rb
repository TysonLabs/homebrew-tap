class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.85"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.85/lazyide-macos-aarch64.tar.gz"
      sha256 "752d21f52c50daffb5bcdd1685c60c630c948598fcd7a80c89ba1cd5b2b89701"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.85/lazyide-macos-x86_64.tar.gz"
      sha256 "3626029224f7c45778e731b6a90849fa7275477e202386fc82bf07c42911ca02"
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
