class Simile < Formula
  desc "Compile and run faithful local models of service APIs"
  homepage "https://os.inttegro.dev/simile"
  url "https://github.com/inttegro/simile/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "a909ca25bc8a8c740a88d13fe34d39f92fbfdcaa4c7f539e9d10502e6163e354"
  license "MIT"
  head "https://github.com/inttegro/simile.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/simile-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/simile version")
    assert_match '"ok": true', shell_output("#{bin}/simile --output json doctor")
  end
end
