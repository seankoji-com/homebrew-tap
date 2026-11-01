class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.22.1/frugalbar-v0.22.1-arm64.tar.gz"
  sha256 "e3a0dbc1190844a2224008d64a55a3376ec2d95f386262db20aad54c94bfd7c5"

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
