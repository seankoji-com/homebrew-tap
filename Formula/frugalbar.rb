class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.1.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.1.0/frugalbar-v0.1.0-arm64.tar.gz"
  sha256 "595c610d654bcb1195b896487094579ed67b9c5f8657d0e3acf785a6a7a9766e"

  depends_on :macos

  def install
    bin.install "frugalbar"
  end

  test do
    system "#{bin}/frugalbar", "--help" rescue true
  end
end
