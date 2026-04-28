class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "0.9.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/lethe-v0.9.0/lethe-macos-arm64.tar.gz"
  sha256 "cfcba09d746cb356ef9b0173657dd9c4bf53e81e214a7d94e123006c6154b671"

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
