class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.11.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.11.0/frugalbar-v0.11.0-arm64.tar.gz"
  sha256 "d1c77b26776292bae700c5c0263a6ecdcde105bb2e08cfc45f544eed51b49e4c"

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
