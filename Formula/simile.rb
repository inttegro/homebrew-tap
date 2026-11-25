class Simile < Formula
  desc "Compile and run faithful local models of service APIs"
  homepage "https://os.inttegro.dev/simile"
  url "https://github.com/inttegro/simile/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "c95d92e0221d59b27fb4e9c67ab059c282b47e1bf16faad2286eb303fc964154"
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
