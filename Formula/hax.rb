class Hax < Formula
  desc "Minimalist, terminal-native coding agent written in C"
  homepage "https://usehax.dev"
  url "https://github.com/OleksandrChekhovskyi/hax/releases/download/v0.6.1/hax-0.6.1.tar.xz"
  sha256 "b46c13187770dfab577cee3b0a77d0c7d62280c715c3b839602ca88a1ae37a1a"
  license "MIT"
  head "https://github.com/OleksandrChekhovskyi/hax.git", branch: "master"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "jansson"

  uses_from_macos "curl"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end

  test do
    assert_match "hax v#{version}", shell_output("#{bin}/hax --version")
  end
end
