class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "lethe-v0.7.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/lethe-v0.7.0/lethe-macos-arm64.tar.gz"
  sha256 "2d908cdf70253cfbf671facdd033d955a66d82d79ed4234d9834be2b5fe904a0"

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
