class RecognizerSenseThresholds < Formula
  desc "Recognizer metric thresholds sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.3/sensors-0.1.3.tar.gz"
  version "0.1.3"
  sha256 "cdb3a43c1db5084f8bb502a3769de8a126df566d74ab104cc67aa77d11fa81d9"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-thresholds"
  end

  test do
    assert_equal "0.1.3", shell_output("#{bin}/recognizer-sense-thresholds --version").strip
  end
end
