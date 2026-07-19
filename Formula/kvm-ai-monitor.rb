class KvmAiMonitor < Formula
  desc "AI subscription usage wallpaper for the GL.iNet Comet Pro KVM"
  homepage "https://github.com/ivangong24/kvm_AI_monitor"
  url "https://github.com/ivangong24/kvm_AI_monitor/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e5f99396fd98cdf2357813a483e3623d7ae57b34e33dbdeec3cfa4db5de336e3"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/kvm-ai-monitor.mjs" => "kvm-ai-monitor"
  end

  def caveats
    <<~EOS
      Run the guided setup with:
        kvm-ai-monitor
      The monitored-Mac helper and Claude hooks are installed by the wizard itself.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kvm-ai-monitor version")
  end
end
