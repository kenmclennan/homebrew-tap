class RecognizerSenseThresholds < Formula
  desc "Recognizer metric thresholds sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.2/sensors-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "1e1ac380df433064e70c703f201c1e72a8230f6933a6fdfcc1d15df1a54eef00"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-thresholds"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/recognizer-sense-thresholds --version").strip
  end
end
