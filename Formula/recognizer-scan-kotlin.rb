class RecognizerScanKotlin < Formula
  desc "Recognizer scanner for Kotlin"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-kotlin-v0.1.1/scan-kotlin-0.1.1.tar.gz"
  version "0.1.1"
  sha256 "61ec4200c5b0e9a060aa1b8d5a3df3b11d94b35949abb8c644be3e5ce335f41f"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-kotlin"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/recognizer-scan-kotlin --version").strip
  end
end
