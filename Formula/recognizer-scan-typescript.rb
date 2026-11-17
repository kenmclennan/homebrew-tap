class RecognizerScanTypescript < Formula
  desc "Recognizer scanner for TypeScript"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-typescript-v0.1.3/scan-typescript-0.1.3.tar.gz"
  version "0.1.3"
  sha256 "65ec6b6e7cbda39d710700b896dc6fd3f677e9c88a094f8539d80d61ace8ea12"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-typescript"
  end

  test do
    assert_equal "0.1.3", shell_output("#{bin}/recognizer-scan-typescript --version").strip
  end
end
