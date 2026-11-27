class Nookdeck < Formula
  desc "Turn an old phone into a Stream Deck-style control panel for your computer"
  homepage "https://nookdeck.app"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-arm64"
      sha256 "fdaab91c2e387b8c4f2e9ca7648900b8bacb7807fa42d677ca26e1cb0be3cd28"
    end
    on_intel do
      url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/nookdeck-darwin-x64"
      sha256 "2dabb5cf694b8749dbaeee89b2791b1ee939406c8bd940376fccd2eb9e24ad7c"
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
