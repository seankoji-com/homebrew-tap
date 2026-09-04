class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.8.1"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.8.1/frugalbar-v0.8.1-arm64.tar.gz"
  sha256 "de889837cc2d49bcd11735d4be481e54aebc858bda3322dc22f785e4fc70090a"

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
