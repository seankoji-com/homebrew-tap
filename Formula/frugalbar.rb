class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.4.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.4.0/frugalbar-v0.4.0-arm64.tar.gz"
  sha256 "2469b0ece1b740a380af2e6659e9a0bff3fea8fd8b92b44924acdecdc12727e6"

  depends_on :macos

  def install
    bin.install "frugalbar"
  end

  service do
    run [opt_bin/"frugalbar"]
    keep_alive true
    process_type :interactive
  end

  test do
    system "#{bin}/frugalbar", "--help" rescue true
  end
end
