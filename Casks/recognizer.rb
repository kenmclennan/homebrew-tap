cask "recognizer" do
  version "0.1.81"
  sha256 "548532e6676a42e848652f310f11ec2ead46da2ef33a504f1a008ffe978f029f"

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
