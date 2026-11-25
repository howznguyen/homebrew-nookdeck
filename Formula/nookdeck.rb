class Nookdeck < Formula
  desc "Turn an old phone into a Stream Deck-style control panel for your computer"
  homepage "https://nookdeck.app"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-arm64"
      sha256 "5d9106838bb75f51045aaea438a175acb802cea69329d2275f2b8e5056dd8b13"
    end
    on_intel do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-x64"
      sha256 "5e994bd61a86acfac611212abe2633f9c3b2f954b64ab885f93f0f4ffa13b6af"
    end
  end

  def install
    bin.install Dir["nookdeck-darwin-*"].first => "nookdeck"
  end

  def caveats
    <<~EOS
      Set Nookdeck up (login service, pairing PIN and phone address):
        nookdeck install

      After every `brew upgrade nookdeck`, run `nookdeck install` again.
      It keeps the program in ~/.nookdeck/bin, so macOS keeps the
      Accessibility permission across upgrades.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nookdeck --version")
  end
end
