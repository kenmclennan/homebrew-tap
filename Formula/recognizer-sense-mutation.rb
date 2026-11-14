class RecognizerSenseMutation < Formula
  desc "Recognizer mutation testing sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.0/sensors-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "7071da37d9c4eded5cf81326c13723b08a3c829cd95256f6edc15b6a27cffca0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-mutation"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/recognizer-sense-mutation --version").strip
  end
end
