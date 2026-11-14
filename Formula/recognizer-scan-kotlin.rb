class RecognizerScanKotlin < Formula
  desc "Recognizer scanner for Kotlin"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-kotlin-v0.1.0/scan-kotlin-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "d07cd803e2fb2af8804ee08e57b93e68838515ead2cdbc24bb0254d84646cccf"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-kotlin"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/recognizer-scan-kotlin --version").strip
  end
end
