cask "nookdeck-app" do
  version "0.7.3"
  sha256 "964a1390f8f41b853913e70e7153a5e7c29c29c31384b0ba3abbca1b862eb73a"

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
