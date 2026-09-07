class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.9.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.9.0/frugalbar-v0.9.0-arm64.tar.gz"
  sha256 "5fdbdbc3bdc65cadb3d83eb0bbf59fce46b8c88fe77ceb2ba7e1a64431ae374a"

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
