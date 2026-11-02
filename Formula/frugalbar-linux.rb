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
    (testpath/"frugalbar_linux.py").write "raise RuntimeError('cwd shadowed the installed package')\n"
    result = Dir.chdir(testpath) do
      assert_match version.to_s, shell_output("#{bin}/frugalbar-linux --version")
      JSON.parse(shell_output("#{bin}/frugalbar-linux --demo --json"))
    end
    assert_equal true, result["illustrative"]
    providers = result["providers"]
    assert_kind_of Array, providers
    refute_empty providers
    assert_kind_of Hash, providers.first
    %w[provider name windows balances plan state].each do |key|
      assert providers.first.key?(key), "demo provider is missing #{key}"
    end
    system formula_opt_bin("python@3.15")/"python3.15", "-I", "-c", <<~PY
      import gi
      gi.require_version("Gtk", "3.0")
      gi.require_version("GdkPixbuf", "2.0")
      gi.require_version("Secret", "1")
      from gi.repository import GdkPixbuf, Gtk, Secret
      path = "#{libexec}/frugalbar_linux/assets/openai.svg"
      loader, width, height = GdkPixbuf.Pixbuf.get_file_info(path)
      if loader is None or width < 1 or height < 1:
          raise RuntimeError("No gdk-pixbuf SVG loader: " + path)
      GdkPixbuf.Pixbuf.new_from_file_at_scale(path, 26, 26, True)
    PY
  end
end
