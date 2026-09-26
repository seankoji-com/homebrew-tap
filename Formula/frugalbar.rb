class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.12.2"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.12.2/frugalbar-v0.12.2-arm64.tar.gz"
  sha256 "83f2eacbf6506b270e0228e181ab61edb46bf9a61e0d29164124f1c9ff2b43ea"

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
