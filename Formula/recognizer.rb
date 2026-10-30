class Recognizer < Formula
  desc "Scans codebases into a language-neutral structure model"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v0.1.32/recognizer-toolchain.tar.gz"
  version "0.1.32"
  sha256 "6e8f7ce9fb50569c337bb9ca1e66e3eae30b70f553eb70fa26cfb21d24fc20a6"
  license "MIT"

  depends_on "node"
  depends_on "python@3.13"

  def install
    libexec.install "node_modules"
    bin.install_symlink libexec/"node_modules/recognizer/dist/bin.js" => "recognizer"
    bin.install_symlink libexec/"node_modules/recognizer-scan-typescript/dist/bin.js" => "recognizer-scan-typescript"

    system formula_opt_bin("python@3.13")/"python3.13", "-m", "venv", libexec/"venv"
    system libexec/"venv/bin/pip", "install", "recognizer_scan_python-0.1.32-py3-none-any.whl"
    bin.install_symlink libexec/"venv/bin/recognizer-scan-python"

    doc.install "THIRD-PARTY-NOTICES.md", "LICENSE"
  end

  test do
    assert_match "0.1.32", shell_output("#{bin}/recognizer --version")
    assert_match "0.1.32", shell_output("#{bin}/recognizer-scan-typescript --version")
    assert_match "0.1.32", shell_output("#{bin}/recognizer-scan-python --version")
  end
end
