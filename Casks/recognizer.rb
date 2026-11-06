cask "recognizer" do
  version "0.1.123"
  sha256 "c734e8d1e4a9ad6b83fda2fbc2ff80a74e811f1dbbda2d857e6bf1bbe6e0c833"

  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v#{version}/recognizer.app.tar.gz"
  name "Recognizer"
  desc "Native viewer for the structure of a codebase"
  homepage "https://github.com/kenmclennan/recognizer-releases"

  depends_on arch: :arm64
  depends_on formula: "node"
  depends_on formula: "python@3.13"
  depends_on :macos

  app "Recognizer.app"

  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/node_modules/recognizer/dist/bin.js", target: "recognizer"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/node_modules/recognizer-scan-typescript/dist/bin.js", target: "recognizer-scan-typescript"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/node_modules/recognizer-describe-claude/dist/bin.js", target: "recognizer-describe-claude"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/bin/recognizer-scan-python"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/bin/recognizer-scan-kotlin"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/bin/recognizer-scan-csharp"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/bin/recognizer-sensors"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/recognizer-scan-rust"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Recognizer.app"]
  end
end
