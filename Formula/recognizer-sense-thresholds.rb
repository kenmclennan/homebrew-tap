class RecognizerSenseThresholds < Formula
  desc "Recognizer metric thresholds sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.1/sensors-0.1.1.tar.gz"
  version "0.1.1"
  sha256 "0ec4da7e791ba8c2feb93c8aa77ec702905ba3696b451400644267ec463aef5c"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-thresholds"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/recognizer-sense-thresholds --version").strip
  end
end
