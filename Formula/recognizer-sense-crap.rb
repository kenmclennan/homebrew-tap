class RecognizerSenseCrap < Formula
  desc "Recognizer C.R.A.P. sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.9/sensors-0.1.9.tar.gz"
  version "0.1.9"
  sha256 "9c45364a2ae316e6cef3450924fd443c410829877d09a896bb19aad1f1b81b8e"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-crap"
  end

  test do
    assert_equal "0.1.9", shell_output("#{bin}/recognizer-sense-crap --version").strip
  end
end
