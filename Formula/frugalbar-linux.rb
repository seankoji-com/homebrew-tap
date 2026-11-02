# frozen_string_literal: true

# FrugalBar for Linux: AI usage and balances in the Cinnamon tray.
class FrugalbarLinux < Formula
  desc "AI subscription usage and balances in the Linux Mint Cinnamon tray"
  homepage "https://github.com/seankoji-com/frugalbar-linux"
  url "https://github.com/seankoji-com/frugalbar-linux/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8c7d02b6bd4357c6b16a75cfd8f027c166d8274a1f1bcd79491e06770ff2f208"
  license "MIT"

  depends_on "gtk+3"
  depends_on "librsvg"
  depends_on "libsecret"
  depends_on :linux
  depends_on "pygobject3"
  depends_on "python@3.15"

  def install
    # Upstream resolves argv[0] into the versioned Cellar. Desktop and login
    # entries must keep following this formula's opt link after an upgrade.
    inreplace "frugalbar_linux/config.py", "executable = Path(sys.argv[0]).resolve()",
              "executable = Path(#{(opt_bin/"frugalbar-linux").to_s.dump})"
    libexec.install "frugalbar_linux"
    libexec.install "packaging/launch.py"
    (bin/"frugalbar-linux").write <<~SH
      #!/bin/sh
      export PATH="#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:$PATH"
      exec "#{formula_opt_bin("python@3.15")}/python3.15" -I "#{libexec}/launch.py" "$@"
    SH
  end

  def caveats
    <<~EOS
      Launch frugalbar-linux inside your Cinnamon desktop session.
      Add it to the application menu with: frugalbar-linux --install-desktop
      Settings can enable login startup and read-only CLI credential discovery.
      Keys saved in Settings use your desktop Secret Service login keyring.
      Tray support targets Cinnamon on X11. If no tray host is available,
      FrugalBar stays usable as a normal window. Do not run it with sudo.
    EOS
  end

  test do
    ENV.prepend_path "PATH", HOMEBREW_PREFIX/"bin"
    ENV["XDG_DATA_HOME"] = (testpath/"data").to_s
    ENV["XDG_CONFIG_HOME"] = (testpath/"config").to_s
    assert_match version.to_s, shell_output("#{bin}/frugalbar-linux --version")
    result = JSON.parse(shell_output("#{bin}/frugalbar-linux --demo --json"))
    assert_equal true, result["illustrative"]
    assert_equal 10, result["providers"].length
    system opt_bin/"frugalbar-linux", "--install-desktop"
    assert_match "Exec=\"#{opt_bin}/frugalbar-linux\"\n",
                 (testpath/"data/applications/frugalbar-linux.desktop").read
    system formula_opt_bin("python@3.15")/"python3.15", "-I", "-c", <<~PY
      import sys
      import gi
      sys.path.insert(0, "#{libexec}")
      from frugalbar_linux import config, secretstore
      assert secretstore.available(), "secret-tool must be discoverable on PATH"
      config.set_autostart(True)
      entry = config.config_root() / "autostart/frugalbar-linux.desktop"
      assert 'Exec="#{opt_bin}/frugalbar-linux" --hidden\\n' in entry.read_text()
      gi.require_version("GdkPixbuf", "2.0")
      from gi.repository import GdkPixbuf
      GdkPixbuf.Pixbuf.new_from_file_at_scale("#{libexec}/frugalbar_linux/assets/openai.svg", 26, 26, True)
    PY
  end
end
