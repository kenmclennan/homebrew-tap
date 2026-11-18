cask "recognizer" do
  version "0.1.252"
  sha256 "e0b4dd7c76cb05fec574e8235d0a4ee8cae86b92c277d39b91c5a69fd452c391"

  url "https://github.com/kenmclennan/recognizer-releases/releases/download/v#{version}/recognizer.app.tar.gz"
  name "Recognizer"
  desc "Native viewer for the structure of a codebase"
  homepage "https://github.com/kenmclennan/recognizer-releases"

  depends_on arch: :arm64
  depends_on formula: "node"
  depends_on formula: "kenmclennan/tap/recognizer-plugins"
  depends_on :macos

  app "Recognizer.app"

  binary "#{appdir}/Recognizer.app/Contents/Resources/toolchain/commands/recognizer"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Recognizer.app"]

    run "/bin/sh",
        args: ["-c", <<~'SH', "sh", "node"],
          if ! /usr/bin/perl -e 'alarm 15; exec @ARGV' "${SHELL:-/bin/zsh}" -ilc "command -v $1" </dev/null >/dev/null 2>&1; then
            printf '%s\n' "Recognizer needs $1 on your login shell's PATH, and it was not found there. Add this line to your shell's startup file (for example ~/.zshrc), then reopen Recognizer:" '  eval "$(/opt/homebrew/bin/brew shellenv)"' >&2
          fi
        SH
        must_succeed: false
  end
end
