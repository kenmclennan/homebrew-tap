class RecognizerPlugins < Formula
  desc "Every official Recognizer plugin"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/recognizer-plugins-v1/recognizer-plugins-1.tar.gz"
  version "1"
  sha256 "3109cdb7f2c74ca27133450f8fccdd2fc9c9edc0596c38ce0c3a9f34a0fb983d"
  license "MIT"

  depends_on "recognizer-scan-python"
  depends_on "recognizer-scan-typescript"
  depends_on "recognizer-scan-kotlin"
  depends_on "recognizer-scan-csharp"
  depends_on "recognizer-scan-rust"
  depends_on "recognizer-sense-crap"
  depends_on "recognizer-sense-mutation"
  depends_on "recognizer-sense-thresholds"
  depends_on "recognizer-describe-claude"

  def install
    libexec.install "members.txt"
  end

  test do
    members = (libexec/"members.txt").read.split
    %w[recognizer-scan-python recognizer-scan-typescript recognizer-scan-kotlin recognizer-scan-csharp recognizer-scan-rust recognizer-sense-crap recognizer-sense-mutation recognizer-sense-thresholds recognizer-describe-claude].each do |member|
      assert_includes members, member
    end
  end
end
