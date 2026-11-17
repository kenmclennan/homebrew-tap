class RecognizerScanCsharp < Formula
  desc "Recognizer scanner for C#"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-csharp-v0.1.1/scan-csharp-0.1.1.tar.gz"
  version "0.1.1"
  sha256 "4f73657ac0da4ceee6b2bf416f28b1790ae0eeeb55e6a025b1bdaf4fa9c7c8ca"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-csharp"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/recognizer-scan-csharp --version").strip
  end
end
