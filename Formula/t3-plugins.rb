class T3Plugins < Formula
  desc "Plugin engine and imps workflow for T3 Code"
  homepage "https://github.com/seankoji-com/t3-plugins"
  url "https://github.com/seankoji-com/t3-plugins/releases/download/v0.1.1/t3-plugins-v0.1.1.tar.gz"
  sha256 "96608b86490fdedeef63667312a80b6e19c581ae9c70072d6c33b7a41f9cd0ba"
  license "MIT"
  head "https://github.com/seankoji-com/t3-plugins.git", branch: "master"

  depends_on "python@3.12"

  def install
    libexec.install "core", "plugins", "scripts"

    python3 = formula_opt_bin("python@3.12")/"python3"
    (bin/"t3-plugins").write <<~EOS
      #!/bin/bash
      exec "#{python3}" "#{libexec}/scripts/install.py" "$@"
    EOS

    (bin/"imps").write <<~EOS
      #!/bin/bash
      TARGET_VERSION="0.1.1"
      LINK="$HOME/.local/share/t3-plugins/imps/current"
      if [ ! -L "$LINK" ] || [[ "$(readlink "$LINK" 2>/dev/null)" != *"/imps/${TARGET_VERSION}"* ]]; then
        "#{python3}" "#{libexec}/scripts/install.py" --force >/dev/null 2>&1 || true
      fi
      exec "#{python3}" "#{libexec}/plugins/imps/cli.py" "$@"
    EOS
  end

  test do
    system bin/"t3-plugins", "--dry-run"
    system bin/"imps", "--help"
  end
end
