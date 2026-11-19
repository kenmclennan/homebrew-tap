class RecognizerScanRust < Formula
  desc "Recognizer scanner for Rust"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/scan-rust-v0.1.5/scan-rust-0.1.5.tar.gz"
  version "0.1.5"
  sha256 "f1d04373d9a1c75fae64cea4191ce63b51f735165b476151baaae6b07bc0336c"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-scan-rust"
  end

  test do
    assert_equal "0.1.5", shell_output("#{bin}/recognizer-scan-rust --version").strip
  end
end
