class RecognizerDescribeClaude < Formula
  desc "Recognizer module describer that uses Claude"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/describe-claude-v0.1.2/describe-claude-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "3dedc20b88e250f1ef42f40695e787e83f56f2490b984e03e470fa45f9bac496"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/recognizer-describe-claude"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/recognizer-describe-claude --version").strip
  end
end
