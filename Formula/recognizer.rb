class Recognizer < Formula
  desc "Scans codebases into a language-neutral structure model"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v0.1.31/recognizer-toolchain.tar.gz"
  version "0.1.31"
  sha256 "c5fc65c2579ed300f46e8730ed98d83b91f5e7d00651c4795a769becc2ac18c0"
  license "MIT"

  depends_on "node"
  depends_on "python@3.13"

  def install
    libexec.install "node_modules"
    bin.install_symlink libexec/"node_modules/recognizer/dist/bin.js" => "recognizer"
    bin.install_symlink libexec/"node_modules/recognizer-scan-typescript/dist/bin.js" => "recognizer-scan-typescript"

    system formula_opt_bin("python@3.13")/"python3.13", "-m", "venv", libexec/"venv"
    system libexec/"venv/bin/pip", "install", "recognizer_scan_python-0.1.31-py3-none-any.whl"
    bin.install_symlink libexec/"venv/bin/recognizer-scan-python"

    doc.install "THIRD-PARTY-NOTICES.md", "LICENSE"
  end

  test do
    assert_match "0.1.31", shell_output("#{bin}/recognizer --version")
    assert_match "0.1.31", shell_output("#{bin}/recognizer-scan-typescript --version")
    assert_match "0.1.31", shell_output("#{bin}/recognizer-scan-python --version")
  end
end
