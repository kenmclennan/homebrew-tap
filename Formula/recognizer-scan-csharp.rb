class RecognizerScanCsharp < Formula
  desc "Recognizer scanner for C#"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-csharp-v0.1.3/scan-csharp-0.1.3.tar.gz"
  version "0.1.3"
  sha256 "db85d62830d092c0541cddf86c27df9780a31364a19980a51a420194ff4ac90c"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-csharp"
  end

  test do
    assert_equal "0.1.3", shell_output("#{bin}/recognizer-scan-csharp --version").strip
  end
end
