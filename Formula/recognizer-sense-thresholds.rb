class RecognizerSenseThresholds < Formula
  desc "Recognizer metric thresholds sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.8/sensors-0.1.8.tar.gz"
  version "0.1.8"
  sha256 "3c9774036eb984ee4abdaa5bf5dcbe2111c90a6f63ba9ed6810972ca9330b07d"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-thresholds"
  end

  test do
    assert_equal "0.1.8", shell_output("#{bin}/recognizer-sense-thresholds --version").strip
  end
end
