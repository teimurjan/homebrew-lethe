class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "0.11.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/lethe-v0.11.0/lethe-macos-arm64.tar.gz"
  sha256 "b0b8b20f7515e4a7e123655e1cecc863cd3cadf45b25b371a0bf4bc95cc97fde"

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
