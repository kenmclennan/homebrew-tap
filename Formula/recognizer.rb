class Recognizer < Formula
  desc "Scans codebases into a language-neutral structure model"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v0.1.29/recognizer-toolchain.tar.gz"
  version "0.1.29"
  sha256 "66750829eaf0b2f27ce4513c6b33813977fcc4e4413b005c36fe5ab21904317a"
  license "MIT"

  depends_on "node"
  depends_on "python@3.13"

  def install
    system "npm", "install", *std_npm_args,
           "recognizer-0.1.29.tgz", "recognizer-scan-typescript-0.1.29.tgz"
    bin.install_symlink libexec/"bin/recognizer"
    bin.install_symlink libexec/"bin/recognizer-scan-typescript"

    system formula_opt_bin("python@3.13")/"python3.13", "-m", "venv", libexec/"venv"
    system libexec/"venv/bin/pip", "install", "recognizer_scan_python-0.1.29-py3-none-any.whl"
    bin.install_symlink libexec/"venv/bin/recognizer-scan-python"

    doc.install "THIRD-PARTY-NOTICES.md", "LICENSE"
  end

  test do
    assert_match "0.1.29", shell_output("#{bin}/recognizer --version")
    assert_match "0.1.29", shell_output("#{bin}/recognizer-scan-typescript --version")
    assert_match "0.1.29", shell_output("#{bin}/recognizer-scan-python --version")
  end
end
