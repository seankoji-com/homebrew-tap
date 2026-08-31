class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.6.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.6.0/frugalbar-v0.6.0-arm64.tar.gz"
  sha256 "303c82d9d5579280bf5f50a56075d3deb164be1b8b2c94bd10024eee77ff48fc"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "frugalbar"
  end

  service do
    run [opt_bin/"frugalbar"]
    keep_alive true
    process_type :interactive
  end

  test do
    system "#{bin}/frugalbar", "--help"
  end
end
