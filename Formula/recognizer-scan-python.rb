class RecognizerScanPython < Formula
  desc "Recognizer scanner for Python"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-python-v0.1.3/scan-python-0.1.3.tar.gz"
  version "0.1.3"
  sha256 "15d6ddfe489ef954b8a75e5ef3779276f8420bc29a6d8fe3547597771fc82228"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-python"
  end

  test do
    assert_equal "0.1.3", shell_output("#{bin}/recognizer-scan-python --version").strip
  end
end
