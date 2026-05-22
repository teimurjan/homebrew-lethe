class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "0.14.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/lethe-v0.14.0/lethe-macos-arm64.tar.gz"
  sha256 "1cff57053e89245ba4decb1a1a99e4f92576a9122468de2e93667bd18c73374e"

  def install
    bin.install "lethe"
    bin.install "lethe-claude-code"
    bin.install "lethe-codex"
    # All binaries are linked with rpath `@loader_path`, so
    # libduckdb resolves when shipped alongside them in bin/.
    bin.install "libduckdb.dylib"
  end

  test do
    system "#{bin}/lethe", "--version"
    system "#{bin}/lethe-claude-code", "--version"
    system "#{bin}/lethe-codex", "--version"
  end
end
