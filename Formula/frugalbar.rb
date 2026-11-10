class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.24.1/frugalbar-v0.24.1-arm64.tar.gz"
  sha256 "543267b8dfbd7bbff0edd1c1239226e5fca44655d57f5c16d807244e6db7ca69"

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
