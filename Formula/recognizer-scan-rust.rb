class RecognizerScanRust < Formula
  desc "Recognizer scanner for Rust"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-rust-v0.1.3/scan-rust-0.1.3.tar.gz"
  version "0.1.3"
  sha256 "7b69c3e288a12308388d036e72da82150536b88e722ddab0e3949d0d688982cc"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-rust"
  end

  test do
    assert_equal "0.1.3", shell_output("#{bin}/recognizer-scan-rust --version").strip
  end
end
