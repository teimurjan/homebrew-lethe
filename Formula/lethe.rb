class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "0.16.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/lethe-v0.16.0/lethe-macos-arm64.tar.gz"
  sha256 "f6a04d57b35f2a562bcf70b5aa49bc29eea8eb35f9b6771a49a71fb53dc0479f"

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
