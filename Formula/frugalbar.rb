class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.5.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.5.0/frugalbar-v0.5.0-arm64.tar.gz"
  sha256 "6796e968f8f476a8a4f7ef79aa4f1d457b93b40293c73c5f842af56e4b31893b"

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
