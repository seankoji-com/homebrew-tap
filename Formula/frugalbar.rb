class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.14.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.14.0/frugalbar-v0.14.0-arm64.tar.gz"
  sha256 "3ad501aae51537f95605f50dc03e2ce209be8ab6d79de3992df86f02ed23972f"

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
