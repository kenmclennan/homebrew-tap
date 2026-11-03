cask "recognizer" do
  version "0.1.86"
  sha256 "ad6f6873491590d8bf730a41ae38068ee0d72f45127989a6748bbe4c087ec4c9"

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
