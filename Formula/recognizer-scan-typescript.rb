class RecognizerScanTypescript < Formula
  desc "Recognizer scanner for TypeScript"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-typescript-v0.1.2/scan-typescript-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "7c6c11088bd9f18a4625d6f4d40f1418d060e9e8abd79426adeda2f48b221a8f"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-typescript"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/recognizer-scan-typescript --version").strip
  end
end
