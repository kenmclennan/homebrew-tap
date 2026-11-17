class RecognizerScanKotlin < Formula
  desc "Recognizer scanner for Kotlin"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-kotlin-v0.1.2/scan-kotlin-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "166f14b8044cb4ce079f8ee24d676b5eb816faac825d6d406fd3bfaaf1462d88"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-kotlin"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/recognizer-scan-kotlin --version").strip
  end
end
