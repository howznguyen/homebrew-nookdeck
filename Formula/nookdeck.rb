class Nookdeck < Formula
  desc "Turn an old phone into a Stream Deck-style control panel for your computer"
  homepage "https://nookdeck.app"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-arm64"
      sha256 "9e65fd80e66feb099d108382cf8ebd3d334af0df7126c0a7aa2bb6884f7c334f"
    end
    on_intel do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-x64"
      sha256 "5b4a260fd4e19aad75bff06c916a51ee11cbc48bc2aa4aedb9a9b670c5014918"
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
