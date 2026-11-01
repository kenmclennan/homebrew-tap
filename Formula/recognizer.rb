class Recognizer < Formula
  desc "Scans codebases into a language-neutral structure model"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v0.1.53/recognizer-toolchain.tar.gz"
  version "0.1.53"
  sha256 "786724a9cbc6c131dc37b23f89ee477e5ac78c996d18ae2833278045a7265755"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"
  depends_on "python@3.13"

  def install
    libexec.install "node_modules"
    bin.install_symlink libexec/"node_modules/recognizer/dist/bin.js" => "recognizer"
    bin.install_symlink libexec/"node_modules/recognizer-scan-typescript/dist/bin.js" => "recognizer-scan-typescript"
    bin.install_symlink libexec/"node_modules/recognizer-describe-claude/dist/bin.js" => "recognizer-describe-claude"

    system formula_opt_bin("python@3.13")/"python3.13", "-m", "venv", libexec/"venv"
    system libexec/"venv/bin/pip", "install", "--no-index", "--find-links", "wheelhouse",
           "recognizer_scan_python-0.1.53-py3-none-any.whl",
           "recognizer_scan_kotlin-0.1.53-py3-none-any.whl"
    bin.install_symlink libexec/"venv/bin/recognizer-scan-python"
    bin.install_symlink libexec/"venv/bin/recognizer-scan-kotlin"

    bin.install "recognizer-scan-rust"

    doc.install "THIRD-PARTY-NOTICES.md", "LICENSE"
  end

  test do
    assert_match "0.1.53", shell_output("#{bin}/recognizer --version")
    assert_match "0.1.53", shell_output("#{bin}/recognizer-scan-typescript --version")
    assert_match "0.1.53", shell_output("#{bin}/recognizer-scan-python --version")
    assert_match "0.1.53", shell_output("#{bin}/recognizer-scan-kotlin --version")
    assert_match "0.1.53", shell_output("#{bin}/recognizer-scan-rust --version")
    assert_match(/prompt-[0-9a-f]{12}/, shell_output("#{bin}/recognizer-describe-claude --prompt-version"))
  end
end
