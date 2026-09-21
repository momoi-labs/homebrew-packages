# Momoi Labs Homebrew packages

Shared Homebrew tap for Momoi Labs apps.

## Install

Once an app's first Cask is published, install it with:

```sh
brew install --cask momoi-labs/packages/<app>
```

For self-host, the command will be:

```sh
brew install --cask momoi-labs/packages/self-host
```

No Casks have been published yet.

## Publishing

Each app's release workflow uses GoReleaser to maintain its Cask in `Casks/`.
Configure the Homebrew repository as `momoi-labs/homebrew-packages` and the
tap name as `momoi-labs/packages` in the app's GoReleaser configuration.

The app's repository needs a `HOMEBREW_TAP_TOKEN` Actions secret with
Contents read and write access to this repository.

AUR packages are published separately to each package's repository on
`aur.archlinux.org`. Release binaries remain in each app's GitHub Releases.
