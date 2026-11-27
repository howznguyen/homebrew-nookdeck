class Nookdeck < Formula
  desc "Turn an old phone into a Stream Deck-style control panel for your computer"
  homepage "https://nookdeck.app"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-arm64"
      sha256 "092c9c970c7927472b7f3b7b4efcbf5295f8ebc8ea27d20e3810e3cd159e059c"
    end
    on_intel do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-x64"
      sha256 "ac6ec10e437b2027ec0a62004f1a51c4f78ace7c322c35c17feda90c9e2eeda3"
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
