# Homebrew tap for hax

Homebrew formulae for [hax](https://github.com/OleksandrChekhovskyi/hax), a minimalist,
terminal-native coding agent written in C.

## Install

```sh
brew install oleksandrchekhovskyi/hax/hax
```

Or `brew tap oleksandrchekhovskyi/hax` and then `brew install hax`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "oleksandrchekhovskyi/hax"
brew "hax"
```

## Maintenance

`Formula/hax.rb` is bumped automatically by the hax release workflow when a new version is
tagged. `brew test-bot` validates pushes and pull requests; see [Homebrew's tap
documentation](https://docs.brew.sh/Taps) for the rest.
