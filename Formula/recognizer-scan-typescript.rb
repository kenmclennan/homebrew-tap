class RecognizerScanTypescript < Formula
  desc "Recognizer scanner for TypeScript"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-typescript-v0.1.1/scan-typescript-0.1.1.tar.gz"
  version "0.1.1"
  sha256 "b8e73981fff4b0fec66af5b073175c91d4a81e9d673151e92b98222294b50119"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-typescript"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/recognizer-scan-typescript --version").strip
  end
end
