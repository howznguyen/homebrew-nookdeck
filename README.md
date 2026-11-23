# Homebrew tap for Nookdeck

[Nookdeck](https://nookdeck.app) turns an old phone into a Stream Deck-style control panel and dashboard for your computer.

## The menu bar app

```sh
brew install --cask howznguyen/nookdeck/nookdeck-app
```

Open Nookdeck from Applications: it starts Nookdeck, shows the pairing QR and opens the management page.
The app is signed with the Nookdeck release identity but not notarized; if macOS refuses to open it, choose
**Open Anyway** in System Settings > Privacy & Security. Newer Homebrew asks you to trust a third-party tap
before it installs a cask from it: `brew trust howznguyen/nookdeck`.

## The command line only

```sh
brew install howznguyen/nookdeck/nookdeck
nookdeck install
```

`nookdeck install` sets up the login service and prints the address and PIN to open on your phone.
After `brew upgrade nookdeck`, run `nookdeck install` again.

Other ways to install: see [nookdeck.app](https://nookdeck.app) or the [README](https://github.com/howznguyen/nookdeck#readme).
