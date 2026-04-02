class Dsync < Formula
  desc "Database migration and synchronization tool"
  homepage "https://adiom.io"
  url "https://github.com/adiom-data/dsync/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "95a58d7fbe657bc7297d03f11a71d40faeb39f865970dcfc9639488bf4876570"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/adiom-data/homebrew-tap/releases/download/dsync-0.26.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "cb5ded1bbff450a2078598c2fb89e88a08629001cdb42e668b34ba7c464381bf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9a8a0a4316bfc66209fc72d73782cebc0c6f9f23d3547d64db89f249211c5e4a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "1e8e7379186308424952923e5fe095b9c6c6e7245b3e76fe5d02ab64b01fee6a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4f06686d18d5a2a58bb11703b9d2c044d7fbc03a341ac3a00f9ca8e60d334c8f"
  end

  depends_on "go" => :build

  def install
    # Standard Homebrew Go build pattern
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    # A simple test to ensure the binary runs
    assert_match "dsync version #{version}", shell_output("#{bin}/dsync --version")
    # Optional: Test a basic help command
    assert_match(/Usage:/i, shell_output("#{bin}/dsync --help"))
  end
end
