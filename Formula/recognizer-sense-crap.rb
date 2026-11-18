class RecognizerSenseCrap < Formula
  desc "Recognizer C.R.A.P. sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.10/sensors-0.1.10.tar.gz"
  version "0.1.10"
  sha256 "ab1393079b4801d99a60584632dcf0a988cca42f2acff425f563b691da073ce8"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-crap"
  end

  test do
    assert_equal "0.1.10", shell_output("#{bin}/recognizer-sense-crap --version").strip
  end
end
