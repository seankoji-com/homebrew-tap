class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.7.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.7.0/frugalbar-v0.7.0-arm64.tar.gz"
  sha256 "615fa887717c3734697b7cec1a6443894a4398c21a20ba811cd2498dbc95fcfc"

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
