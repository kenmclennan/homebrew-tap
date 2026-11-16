class RecognizerDescribeClaude < Formula
  desc "Recognizer module describer that uses Claude"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/describe-claude-v0.1.1/describe-claude-0.1.1.tar.gz"
  version "0.1.1"
  sha256 "1db92009b4da2026bf69792abc9fee50fa3d313307ac5c23c07be1d91db89ba1"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-describe-claude"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/recognizer-describe-claude --version").strip
  end
end
