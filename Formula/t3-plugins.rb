class T3Plugins < Formula
  desc "Provider-neutral workflows and file tools for T3 Code"
  homepage "https://github.com/seankoji-com/t3-plugins"
  url "https://github.com/seankoji-com/t3-plugins/releases/download/v0.4.0/t3-plugins-v0.4.0.tar.gz"
  sha256 "91247661645558550a701576f92fed8b34a6d761c3cf7001b8a0bcde6967e574"
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

  def caveats
    <<~EOS
      Install or update your user's plugin snapshots and slash-menu skills:
        t3-plugins setup
      Enable T3's Show skills in slash menu and restart the agent session.
      Print a prompt to paste into a T3 thread:
        t3-plugins prompt imps doctor
      Check installed file integrity:
        t3-plugins doctor
    EOS
  end

  test do
    system bin/"t3-plugins", "--prefix", testpath/"plugins", "install"
    system bin/"t3-plugins", "--prefix", testpath/"plugins", "doctor"
    system bin/"t3-plugins", "--prefix", testpath/"plugins", "setup", "imps", "--root", testpath/"skills"
    assert_path_exists testpath/"skills/t3-imps/SKILL.md"
    assert_match "prompt-builder", shell_output("#{bin}/t3-plugins list")
    system bin/"imps", "--help"
  end
end
