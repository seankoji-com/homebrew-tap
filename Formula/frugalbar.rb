class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.21.3/frugalbar-v0.21.3-arm64.tar.gz"
  sha256 "7086bbf5794c7d53eb4d793e6006d9a7d89b8e06237143f2b1fbba6dace03630"

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
