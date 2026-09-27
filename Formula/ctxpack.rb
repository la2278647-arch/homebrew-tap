class Ctxpack < Formula
  desc "Pack a repository into one LLM-ready document that fits the context window"
  homepage "https://github.com/la2278647-arch/ctxpack"
  url "https://github.com/la2278647-arch/ctxpack/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "9037f475241cceb7cf2f249e14d8804cdace3fb003799d839813f77fa60f90e6"
  version "0.1.13"
  license "MIT"
  head "https://github.com/la2278647-arch/ctxpack.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/la2278647-arch/ctxpack/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctxpack version")
  end
end