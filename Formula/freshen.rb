class Freshen < Formula
  desc "TUI dashboard for managing and syncing multi-repo setups"
  homepage "https://github.com/seankoji-com/freshen"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seankoji-com/freshen/releases/download/v0.1.1/freshen_0.1.1_darwin_arm64.tar.gz"
      sha256 "a0684c68c7ff3e3d540bca630f294567d9feaa9610c74a7d0667cf810b4dfb34"
    else
      url "https://github.com/seankoji-com/freshen/releases/download/v0.1.1/freshen_0.1.1_darwin_amd64.tar.gz"
      sha256 "e9f3897c36fe68223efcd316ad015b56404740f604eb083575e46b85909e9dd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/seankoji-com/freshen/releases/download/v0.1.1/freshen_0.1.1_linux_arm64.tar.gz"
      sha256 "2917a1673e6af8b5f9c3b2cb422c3f7412e0dbd62d139ec961438ddcfc664520"
    else
      url "https://github.com/seankoji-com/freshen/releases/download/v0.1.1/freshen_0.1.1_linux_amd64.tar.gz"
      sha256 "c95fc3f7d62a27b8510eeff24a4a64f5dfb20eb43b3f44c3f7960a77b35dbdec"
    end
  end

  def install
    bin.install "freshen"
  end

  test do
    assert_match "freshen v0.1.1", shell_output("#{bin}/freshen -v")
  end
end
