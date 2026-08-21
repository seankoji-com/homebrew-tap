class Freshen < Formula
  desc "TUI dashboard for managing and syncing multi-repo setups"
  homepage "https://github.com/seankoji-com/freshen"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seankoji-com/freshen/releases/download/v0.1.0/freshen_0.1.0_darwin_arm64.tar.gz"
      sha256 "28bff8b7f6b64f90af30bbc94b6e57841d14b9d0667c5f0638bae4e3775620de"
    else
      url "https://github.com/seankoji-com/freshen/releases/download/v0.1.0/freshen_0.1.0_darwin_amd64.tar.gz"
      sha256 "5ac7e568fdbad2b9f488184c447a3b1949cc3bb1408246b56688dcfebe106d15"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/seankoji-com/freshen/releases/download/v0.1.0/freshen_0.1.0_linux_arm64.tar.gz"
      sha256 "2135b474303df082c36a58eba36e20fa4dcbad5b521616dba076995d8d0a40d9"
    else
      url "https://github.com/seankoji-com/freshen/releases/download/v0.1.0/freshen_0.1.0_linux_amd64.tar.gz"
      sha256 "6c72eb5c637c5a90909247bc33a8876cfa8828eff146b17580bd64f3b21490f7"
    end
  end

  def install
    bin.install "freshen"
  end

  test do
    assert_match "freshen v0.1.0", shell_output("#{bin}/freshen -v")
  end
end
