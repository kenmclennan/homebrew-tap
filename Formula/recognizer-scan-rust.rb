class RecognizerScanRust < Formula
  desc "Recognizer scanner for Rust"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-rust-v0.1.0/scan-rust-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "aa7247893fb0ed2f84999548bc17f62db34e5caaa1e53ad613cb487c89a67fda"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-rust"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/recognizer-scan-rust --version").strip
  end
end
