class RecognizerScanPython < Formula
  desc "Recognizer scanner for Python"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-python-v0.1.0/scan-python-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "5bc7bb046a8d005dac7f812e7fda5cead11ecaa4270131bba6d3719123b024f5"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-python"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/recognizer-scan-python --version").strip
  end
end
