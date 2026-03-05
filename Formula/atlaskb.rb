class Atlaskb < Formula
  desc "Organizational code knowledge base CLI"
  homepage "https://github.com/TysonLabs/atlaskb"
  url "https://github.com/TysonLabs/atlaskb.git",
      tag: "v0.1.7",
      revision: "5487bffa2d30c1f73e646ef0b4c14e45746fdb69"
  version "0.1.7"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    system "npm", "ci", "--prefix", "web"
    system "npm", "run", "build", "--prefix", "web"
    ldflags = "-s -w -X github.com/tgeorge06/atlaskb/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/atlaskb"
  end

  service do
    run [opt_bin/"atlaskb", "serve"]
    keep_alive true
    log_path var/"log/atlaskb.log"
    error_log_path var/"log/atlaskb.log"
  end

  def caveats
    <<~EOS
      Run initial setup before starting as a background service:
        atlaskb setup

      Start the service:
        brew services start atlaskb
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/atlaskb version").strip
  end
end
