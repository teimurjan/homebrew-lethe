class Lethe < Formula
  desc "Persistent memory store for LLM agents"
  homepage "https://github.com/teimurjan/lethe"
  version "0.17.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/teimurjan/lethe/releases/download/lethe-v0.17.0/lethe-macos-arm64.tar.gz"
  sha256 "c9c4bc64f4ec2ea417cb1b32b3de11947bf6bfe2cad134e50bbe93ece68dc2dc"

  def install
    bin.install "lethe"
    # All binaries are linked with rpath `@loader_path`, so
    # libduckdb resolves when shipped alongside them in bin/.
    bin.install "libduckdb.dylib"
  end

  test do
    system "#{bin}/lethe", "--version"
  end
end
