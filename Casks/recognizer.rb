cask "recognizer" do
  version "0.1.117"
  sha256 "170fe92c3a37adb48147a2c6fcc49882ba43a62726beec4995e0d271f25b7afc"

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
