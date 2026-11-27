cask "nookdeck-app" do
  version "0.7.1"
  sha256 "41b58a411e585fc300acba2775a3888ffb028846cfaccc3e12515074f5d0447e"

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
