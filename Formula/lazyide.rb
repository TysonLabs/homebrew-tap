class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.3.94"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.94/lazyide-macos-aarch64.tar.gz"
      sha256 "13ea3bd24ebdb83bf21086b97d2e7cb6a4120f3dd7fd07de4655e0ee09125c7c"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.94/lazyide-macos-x86_64.tar.gz"
      sha256 "7f7913441be09253f0ec32aa4f1cf823361bdb7bc61daca0c7697f91548f8687"
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
