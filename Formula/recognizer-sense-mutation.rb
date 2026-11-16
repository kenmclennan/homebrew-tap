class RecognizerSenseMutation < Formula
  desc "Recognizer mutation testing sensor"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/sensors-v0.1.6/sensors-0.1.6.tar.gz"
  version "0.1.6"
  sha256 "01288b1f7283aef86ab5a1e4317264dfec303ebe2cf5cfa1376d27921f060f14"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-sense-mutation"
  end

  test do
    assert_equal "0.1.6", shell_output("#{bin}/recognizer-sense-mutation --version").strip
  end
end
