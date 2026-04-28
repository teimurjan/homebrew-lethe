class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "0.8.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/lethe-v0.8.0/lethe-macos-arm64.tar.gz"
  sha256 "83ae226b1276f958399074d1350f107a7d4e82c4084bec92edd6b66e4b497420"

  def install
    bin.install "lethe"
    bin.install "lethe-claude-code"
    # Both binaries are linked with rpath `@loader_path`, so
    # libduckdb resolves when shipped alongside them in bin/.
    bin.install "libduckdb.dylib"
  end

  test do
    system "#{bin}/lethe", "--version"
    system "#{bin}/lethe-claude-code", "--version"
  end
end
