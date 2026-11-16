class RecognizerSenseThresholds < Formula
  desc "Recognizer metric thresholds sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.5/sensors-0.1.5.tar.gz"
  version "0.1.5"
  sha256 "2db9d1d062d9fc377805a41db5181ed348cdc9d753731da6fa3fcbebe6238926"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-thresholds"
  end

  test do
    assert_equal "0.1.5", shell_output("#{bin}/recognizer-sense-thresholds --version").strip
  end
end
