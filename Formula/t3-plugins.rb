class T3Plugins < Formula
  desc "Provider-neutral workflows and file tools for T3 Code"
  homepage "https://github.com/seankoji-com/t3-plugins"
  url "https://github.com/seankoji-com/t3-plugins/releases/download/v0.2.0/t3-plugins-v0.2.0.tar.gz"
  sha256 "f0c2966f211efd7bd9f6bbe8cbc574f0a4ec06695fbc35697c113029af1068c0"
  license "MIT"
  head "https://github.com/seankoji-com/t3-plugins.git", branch: "master"

  depends_on "python@3.12"

  def install
    libexec.install "core", "plugins", "scripts", "shared"

    python3 = formula_opt_libexec("python@3.12")/"bin/python3"
    (bin/"t3-plugins").write <<~EOS
      #!/bin/bash
      exec "#{python3}" "#{libexec}/scripts/catalog.py" "$@"
    EOS

    (bin/"imps").write <<~EOS
      #!/bin/bash
      exec "#{python3}" "#{libexec}/scripts/run_imps.py" "$@"
    EOS
  end

  test do
    system bin/"t3-plugins", "--prefix", testpath/"plugins", "install"
    system bin/"t3-plugins", "--prefix", testpath/"plugins", "doctor"
    assert_match "prompt-builder", shell_output("#{bin}/t3-plugins list")
    system bin/"imps", "--help"
  end

  def caveats
    <<~EOS
      Install or update your user's plugin snapshots:
        t3-plugins install
      Print a prompt to paste into a T3 thread:
        t3-plugins prompt imps doctor
      Check installed file integrity:
        t3-plugins doctor
    EOS
  end
end
