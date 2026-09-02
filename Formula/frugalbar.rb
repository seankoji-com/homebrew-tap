class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.8.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.8.0/frugalbar-v0.8.0-arm64.tar.gz"
  sha256 "d46fc00f5334c2b66b12bd0c13a990d89de5e1edc9fca67b4dd8f0b739ba6cd5"

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
