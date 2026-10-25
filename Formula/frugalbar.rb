class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.21.7/frugalbar-v0.21.7-arm64.tar.gz"
  sha256 "296648fd2ad11dd3383fef29b1a2d9bb7d8b11596e2e56777a150cde5df7dc55"

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
    system bin/"frugalbar", "--help"
  end
end
