class Hax < Formula
  desc "Minimalist, terminal-native coding agent written in C"
  homepage "https://github.com/OleksandrChekhovskyi/hax"
  url "https://github.com/OleksandrChekhovskyi/hax/releases/download/v0.2.0/hax-0.2.0.tar.xz"
  sha256 "c450e145d8aff82a30d3d6cd89595314e5cef1e259ffd5dd64a772b88f0d5893"
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
