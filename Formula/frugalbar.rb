class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.3.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.3.0/frugalbar-v0.3.0-arm64.tar.gz"
  sha256 "23d2ecbcac1340af399e38b815c9ea5aafa007b6ad11f6eaf342fb422b71a563"

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
