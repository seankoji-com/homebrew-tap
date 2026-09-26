class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.12.1"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.12.1/frugalbar-v0.12.1-arm64.tar.gz"
  sha256 "454797e50b6e7c70ada4bbba53527b6aee0e16c77ac463e14a74d972b651512c"

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
