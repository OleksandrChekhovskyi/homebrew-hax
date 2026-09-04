class Hax < Formula
  desc "Minimalist, terminal-native coding agent written in C"
  homepage "https://usehax.dev"
  url "https://github.com/OleksandrChekhovskyi/hax/releases/download/v0.5.0/hax-0.5.0.tar.xz"
  sha256 "c1a15c354969b8700f72ffa7b7eee0ec35d700b229f56f067814237fc0052586"
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
