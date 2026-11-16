class RecognizerSenseCrap < Formula
  desc "Recognizer C.R.A.P. sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.7/sensors-0.1.7.tar.gz"
  version "0.1.7"
  sha256 "33facd19ef3c3dc530cf5719b72b5dc62e87faa87ee6bd124ce6d70aa9e240f0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-crap"
  end

  test do
    assert_equal "0.1.7", shell_output("#{bin}/recognizer-sense-crap --version").strip
  end
end
