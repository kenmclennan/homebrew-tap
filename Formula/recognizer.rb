class Recognizer < Formula
  desc "Scans codebases into a language-neutral structure model"
  homepage "https://github.com/kenmclennan/recognizer-releases"
  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v0.1.33/recognizer-toolchain.tar.gz"
  version "0.1.33"
  sha256 "b601b7fc5233135d53982d6611fdec95e21aecf1e9fb4784625f78c58b7de507"
  license "MIT"

  depends_on "node"
  depends_on "python@3.13"

  def install
    libexec.install "node_modules"
    bin.install_symlink libexec/"node_modules/recognizer/dist/bin.js" => "recognizer"
    bin.install_symlink libexec/"node_modules/recognizer-scan-typescript/dist/bin.js" => "recognizer-scan-typescript"

    system formula_opt_bin("python@3.13")/"python3.13", "-m", "venv", libexec/"venv"
    system libexec/"venv/bin/pip", "install", "recognizer_scan_python-0.1.33-py3-none-any.whl"
    bin.install_symlink libexec/"venv/bin/recognizer-scan-python"

    doc.install "THIRD-PARTY-NOTICES.md", "LICENSE"
  end

  test do
    assert_match "0.1.33", shell_output("#{bin}/recognizer --version")
    assert_match "0.1.33", shell_output("#{bin}/recognizer-scan-typescript --version")
    assert_match "0.1.33", shell_output("#{bin}/recognizer-scan-python --version")
  end
end
