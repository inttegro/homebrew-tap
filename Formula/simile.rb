class Simile < Formula
  desc "Compile and run faithful local models of service APIs"
  homepage "https://os.inttegro.dev/simile"
  url "https://github.com/inttegro/simile/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "17acdf411d48f5ac3c015dec563abfc76fab95660e7c383879ccd9e8f8f0c85e"
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
