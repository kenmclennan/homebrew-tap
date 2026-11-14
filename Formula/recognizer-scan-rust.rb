class RecognizerScanRust < Formula
  desc "Recognizer scanner for Rust"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-rust-v0.1.1/scan-rust-0.1.1.tar.gz"
  version "0.1.1"
  sha256 "cd13e2f6783ad2091d9d283fa304d30f5ebf5fffaa04c5b7887eaeae886861e9"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-rust"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/recognizer-scan-rust --version").strip
  end
end
