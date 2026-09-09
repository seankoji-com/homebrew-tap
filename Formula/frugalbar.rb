class Frugalbar < Formula
  desc "Track AI usage & dev limits in the macOS menu bar"
  homepage "https://github.com/seankoji-com/frugalbar"
  version "0.10.0"
  url "https://github.com/seankoji-com/frugalbar/releases/download/v0.10.0/frugalbar-v0.10.0-arm64.tar.gz"
  sha256 "864b9f33edf0be5339f267efcdfd61c4909d908b0969ff387006f637afec02da"

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
