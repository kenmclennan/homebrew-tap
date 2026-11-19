class RecognizerScanKotlin < Formula
  desc "Recognizer scanner for Kotlin"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-kotlin-v0.1.5/scan-kotlin-0.1.5.tar.gz"
  version "0.1.5"
  sha256 "14ee3c5ee448ceac844ce9d0c938db235a753b0c71d07121e6df1c62d9cbbb1d"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-kotlin"
  end

  test do
    assert_equal "0.1.5", shell_output("#{bin}/recognizer-scan-kotlin --version").strip
  end
end
