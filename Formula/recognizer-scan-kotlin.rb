class RecognizerScanKotlin < Formula
  desc "Recognizer scanner for Kotlin"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-kotlin-v0.1.4/scan-kotlin-0.1.4.tar.gz"
  version "0.1.4"
  sha256 "72daa7d7063e654b1cd20c5123a6d28db82053e81b2299779ab332cbeb550253"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-kotlin"
  end

  test do
    assert_equal "0.1.4", shell_output("#{bin}/recognizer-scan-kotlin --version").strip
  end
end
