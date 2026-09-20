class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.12.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.12.0/frugalbar-v0.12.0-arm64.tar.gz"
  sha256 "d26211e7f8971826a7ecb10b40b9cf79dc7310e1cc5ac6981671f8e349fe6878"

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
