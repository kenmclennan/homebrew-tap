cask "recognizer" do
  version "0.1.80"
  sha256 "5ea04edabaedbe49cd2ed4fbff777cdc2d04af478a65b13b8a2d910cc2cad6e2"

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
