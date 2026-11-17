class RecognizerScanPython < Formula
  desc "Recognizer scanner for Python"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-python-v0.1.1/scan-python-0.1.1.tar.gz"
  version "0.1.1"
  sha256 "a5f22f5ec950525da568faa2db81d689ea47bda3707553172757561874cace91"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-python"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/recognizer-scan-python --version").strip
  end
end
