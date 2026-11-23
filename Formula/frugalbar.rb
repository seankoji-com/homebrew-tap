class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.30.1/frugalbar-v0.30.1-arm64.tar.gz"
  sha256 "fb3ac1b25549079c860eb5eb08999902e793875ab894cc0b0bb7a7eb4ffdf3b4"

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
