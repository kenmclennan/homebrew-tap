class RecognizerSenseCrap < Formula
  desc "Recognizer C.R.A.P. sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.4/sensors-0.1.4.tar.gz"
  version "0.1.4"
  sha256 "88ad4ce25e05752c603538110c63a6aaede844d0d285b02bddada9b7bbdcd2f1"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-crap"
  end

  test do
    assert_equal "0.1.4", shell_output("#{bin}/recognizer-sense-crap --version").strip
  end
end
