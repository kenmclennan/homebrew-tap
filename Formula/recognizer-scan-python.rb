class RecognizerScanPython < Formula
  desc "Recognizer scanner for Python"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-python-v0.1.2/scan-python-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "9b01d3f97eb2f1f478db11addacbed759c0cd739a51336ba5823c36836f1e720"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-python"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/recognizer-scan-python --version").strip
  end
end
