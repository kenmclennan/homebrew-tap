class RecognizerScanCsharp < Formula
  desc "Recognizer scanner for C#"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-csharp-v0.1.0/scan-csharp-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "de59a821148057c22d25e454120b3d5000a2d98685301608f20f196e0c7577e3"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-csharp"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/recognizer-scan-csharp --version").strip
  end
end
