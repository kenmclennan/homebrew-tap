cask "recognizer" do
  version "0.1.60"
  sha256 "2750e59dd26e79cc605a8b0022a944919b4625a23ef5873f87a042aabbb0b29c"

  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v#{version}/recognizer.app.tar.gz"
  name "Recognizer"
  desc "Native viewer for the structure of a codebase"
  homepage "https://github.com/kenmclennan/recognizer-releases"

  depends_on arch: :arm64
  depends_on formula: "kenmclennan/tap/recognizer"
  depends_on :macos

  app "Recognizer.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Recognizer.app"]
  end
end
