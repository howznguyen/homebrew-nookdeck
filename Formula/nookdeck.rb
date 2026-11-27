class Nookdeck < Formula
  desc "Turn an old phone into a Stream Deck-style control panel for your computer"
  homepage "https://nookdeck.app"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-arm64"
      sha256 "88b8e066c886725521921dd06893f6416eac721f8e5b50ef624089e0092c8ded"
    end
    on_intel do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-x64"
      sha256 "49af4998cdd6b4c36a1bd54c6678facfd2ef7e11fbdb0e7607b234674b0dd08d"
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
