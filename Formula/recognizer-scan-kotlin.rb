class RecognizerScanKotlin < Formula
  desc "Recognizer scanner for Kotlin"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-kotlin-v0.1.3/scan-kotlin-0.1.3.tar.gz"
  version "0.1.3"
  sha256 "775ed47db2a808f09925b083820b85f7b91a8e5ef1222d9b21bc84b004799444"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-kotlin"
  end

  test do
    assert_equal "0.1.3", shell_output("#{bin}/recognizer-scan-kotlin --version").strip
  end
end
