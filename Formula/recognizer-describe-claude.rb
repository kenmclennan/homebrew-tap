class RecognizerDescribeClaude < Formula
  desc "Recognizer module describer that uses Claude"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/describe-claude-v0.1.0/describe-claude-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "85d6b017b5a849886b336c1e8c3cf0f8a55fc07814f3a30d1f49a9b107d0fc6d"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-describe-claude"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/recognizer-describe-claude --version").strip
  end
end
