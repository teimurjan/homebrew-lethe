class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "0.12.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/lethe-v0.12.0/lethe-macos-arm64.tar.gz"
  sha256 "c98b9469c0d6202610de4a0439bebbc7c51d3c271ff92ceeb81492a1338504c1"

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
