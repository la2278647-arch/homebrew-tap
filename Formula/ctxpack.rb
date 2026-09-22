class Ctxpack < Formula
  desc "Pack a repository into one LLM-ready document that fits the context window"
  homepage "https://github.com/la2278647-arch/ctxpack"
  url "https://github.com/la2278647-arch/ctxpack/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "aecf74b701f710b606b6f1fde03e9282b3361de6751e59ba7a4b07d8d405b39a"
  version "0.1.2"
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