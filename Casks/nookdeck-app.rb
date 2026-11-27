cask "nookdeck-app" do
  version "0.7.0"
  sha256 "059870595664c8bf9a09990607209797d7d75804479c42786ed0ab4a04203ae9"

  url "https://github.com/howznguyen/nookdeck/releases/download/v#{version}/Nookdeck.dmg"
  name "Nookdeck"
  desc "Menu bar app that turns a phone into a Stream Deck-style control panel"
  homepage "https://nookdeck.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Nookdeck.app"

  zap trash: [
    "~/.nookdeck",
    "~/Library/LaunchAgents/dev.nookdeck.agent.plist",
    "~/Library/Preferences/dev.nookdeck.app.plist",
  ]

  caveats <<~EOS
    Nookdeck is signed with its own release identity but not notarized by Apple.
    If macOS says it cannot check the app, open System Settings > Privacy & Security
    and choose Open Anyway, or run:
      xattr -d com.apple.quarantine /Applications/Nookdeck.app
  EOS
end
