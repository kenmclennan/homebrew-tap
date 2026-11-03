cask "recognizer" do
  version "0.1.77"
  sha256 "9a58586e3a22ff113d29f467565aa8251a3ce692605553f63395cd1e17efce8e"

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
