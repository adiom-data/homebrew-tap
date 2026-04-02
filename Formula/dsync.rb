class Dsync < Formula
  desc "Database migration and synchronization tool"
  homepage "https://adiom.io"
  url "https://github.com/adiom-data/dsync/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "95a58d7fbe657bc7297d03f11a71d40faeb39f865970dcfc9639488bf4876570"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/adiom-data/homebrew-tap/releases/download/dsync-0.24.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "26cc9decdf4cd2d10937b87aebc34df5ce37494b90b6f0e20abb598b5f374ef1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "40a02ad47f62856a4e72ae4fb08fe792f7f35d4fad3d2006b93374a472a556c1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "dd182985fdb8353a877680f4389e75a439df679cc6cd871497fa4039fdc65cd8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e56b5bbd30d353f7dabdbf2b733919c0aed6caae8b25ea21116cc60b98aedd6b"
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
