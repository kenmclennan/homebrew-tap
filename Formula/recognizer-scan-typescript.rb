class RecognizerScanTypescript < Formula
  desc "Recognizer scanner for TypeScript"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-typescript-v0.1.4/scan-typescript-0.1.4.tar.gz"
  version "0.1.4"
  sha256 "0ae70e1fb9cb1684776a949c9034821650e49ad36450458cc1bd54d8d726a62a"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-typescript"
  end

  test do
    assert_equal "0.1.4", shell_output("#{bin}/recognizer-scan-typescript --version").strip
  end
end
