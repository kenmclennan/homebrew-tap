class RecognizerScanCsharp < Formula
  desc "Recognizer scanner for C#"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-csharp-v0.1.2/scan-csharp-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "9feb04468f2f2a5d66cdc64299608f7a0712e7cd9af8275c7b4f43599c78271e"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-csharp"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/recognizer-scan-csharp --version").strip
  end
end
