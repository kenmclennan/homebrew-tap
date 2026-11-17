class RecognizerScanRust < Formula
  desc "Recognizer scanner for Rust"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-rust-v0.1.2/scan-rust-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "3f67fc349fc7536a581f48f3e15b7875d429017e8df13cd62fe3806a32fbe3a4"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-rust"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/recognizer-scan-rust --version").strip
  end
end
