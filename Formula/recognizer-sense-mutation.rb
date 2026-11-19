class RecognizerSenseMutation < Formula
  desc "Recognizer mutation testing sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.11/sensors-0.1.11.tar.gz"
  version "0.1.11"
  sha256 "b6f758b57bad05e99486afb169d394cd1538c2cbd6868ba20ccf94e771bc6a64"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-mutation"
  end

  test do
    assert_equal "0.1.11", shell_output("#{bin}/recognizer-sense-mutation --version").strip
  end
end
