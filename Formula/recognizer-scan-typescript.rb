class RecognizerScanTypescript < Formula
  desc "Recognizer scanner for TypeScript"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-typescript-v0.1.0/scan-typescript-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "03d5546969b58c3248bf3613cc464b5bc9c08e54f40b5759f9e97c5c956cedad"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-typescript"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/recognizer-scan-typescript --version").strip
  end
end
