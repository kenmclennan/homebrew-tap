class RecognizerScanRust < Formula
  desc "Recognizer scanner for Rust"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-rust-v0.1.4/scan-rust-0.1.4.tar.gz"
  version "0.1.4"
  sha256 "ab94c8c05f41cc2efb4ba7d3278622b54589e2734c3a825041afbaa03cd3d215"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-rust"
  end

  test do
    assert_equal "0.1.4", shell_output("#{bin}/recognizer-scan-rust --version").strip
  end
end
