class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.7.1"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.7.1/frugalbar-v0.7.1-arm64.tar.gz"
  sha256 "10f360f075975bddd5d5b6652f738d18abdbb70d6bffb42cab0c4735b5feacc3"

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
