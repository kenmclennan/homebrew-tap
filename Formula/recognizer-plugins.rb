class RecognizerPlugins < Formula
  desc "Every official Recognizer plugin"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/recognizer-plugins-v2/recognizer-plugins-2.tar.gz"
  version "2"
  sha256 "f5fbf4b4ead4e720199e5becd023ba0d4f7fde3cb3d086ccf0b88e57e495ee32"
  license "MIT"

  depends_on "recognizer-scan-python"
  depends_on "recognizer-scan-typescript"
  depends_on "recognizer-scan-kotlin"
  depends_on "recognizer-scan-csharp"
  depends_on "recognizer-scan-rust"
  depends_on "recognizer-sense-crap"
  depends_on "recognizer-sense-mutation"
  depends_on "recognizer-describe-claude"

  def install
    libexec.install "members.txt"
  end

  test do
    members = (libexec/"members.txt").read.split
    %w[recognizer-scan-python recognizer-scan-typescript recognizer-scan-kotlin recognizer-scan-csharp recognizer-scan-rust recognizer-sense-crap recognizer-sense-mutation recognizer-describe-claude].each do |member|
      assert_includes members, member
    end
  end
end
