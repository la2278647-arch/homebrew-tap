class Ctxpack < Formula
  desc "Pack a repository into one LLM-ready document that fits the context window"
  homepage "https://github.com/la2278647-arch/ctxpack"
  url "https://github.com/la2278647-arch/ctxpack/archive/refs/tags/v0.1.14.tar.gz"
  sha256 "34d3d3fff09ca1d403e3386674d60e732baa4136e14a665670991db25c2ae149"
  version "0.1.14"
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