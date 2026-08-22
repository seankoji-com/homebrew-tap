class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.2.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.2.0/frugalbar-v0.2.0-arm64.tar.gz"
  sha256 "d33b81405a2ee83463496b16bc6359e85b66c2a5e993779ea180205d597c0426"

  depends_on :macos

  def install
    bin.install "frugalbar"
  end

  service do
    run [opt_bin/"frugalbar"]
    keep_alive true
    process_type :interactive
  end

  test do
    system "#{bin}/frugalbar", "--help" rescue true
  end
end
