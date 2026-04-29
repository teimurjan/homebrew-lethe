class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "v0.10.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/v0.10.0/lethe-macos-arm64.tar.gz"
  sha256 "ac668af124eafd3b92b6dc02b464ac56ef109caeb94427e28aa2253d26b6c8dc"

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
