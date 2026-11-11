cask "recognizer" do
  version "0.1.184"
  sha256 "86498dca6495bcc95807f9bf8ec988e1a7c4b6a575a28969a83e89b18c1d566e"

  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v#{version}/recognizer.app.tar.gz"
  name "Recognizer"
  desc "Native viewer for the structure of a codebase"
  homepage "https://github.com/kenmclennan/recognizer-releases"

  depends_on arch: :arm64
  depends_on formula: "node"
  depends_on formula: "python@3.13"
  depends_on :macos

  app "Recognizer.app"

  preflight_steps do
    remove "{{HOMEBREW_PREFIX}}/bin/recognizer", symlink_target_contains: "/Cellar/recognizer/"
    remove "{{HOMEBREW_PREFIX}}/bin/recognizer-scan-typescript", symlink_target_contains: "/Cellar/recognizer/"
    remove "{{HOMEBREW_PREFIX}}/bin/recognizer-describe-claude", symlink_target_contains: "/Cellar/recognizer/"
    remove "{{HOMEBREW_PREFIX}}/bin/recognizer-scan-python", symlink_target_contains: "/Cellar/recognizer/"
    remove "{{HOMEBREW_PREFIX}}/bin/recognizer-scan-kotlin", symlink_target_contains: "/Cellar/recognizer/"
    remove "{{HOMEBREW_PREFIX}}/bin/recognizer-scan-csharp", symlink_target_contains: "/Cellar/recognizer/"
    remove "{{HOMEBREW_PREFIX}}/bin/recognizer-sensors", symlink_target_contains: "/Cellar/recognizer/"
    remove "{{HOMEBREW_PREFIX}}/bin/recognizer-scan-rust", symlink_target_contains: "/Cellar/recognizer/"
  end

  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer-scan-typescript"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer-describe-claude"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer-scan-python"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer-scan-kotlin"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer-scan-csharp"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer-sensors"
  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer-scan-rust"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Recognizer.app"]
  end
end
