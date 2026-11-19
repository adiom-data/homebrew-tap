class Dsync < Formula
  desc "Database migration and synchronization tool"
  homepage "https://adiom.io"
  url "https://github.com/adiom-data/dsync/archive/refs/tags/v0.31.0.tar.gz"
  sha256 "48ecfef109820dc8770d2974a7637c27a37feada4010fc951b6c0e30ca973dd5"
  license "AGPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/adiom-data/homebrew-tap/releases/download/dsync-0.31.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e8950e8ed839e87addb9c19f9229c55ae2f99762cc6a529e772a314b7fdd6b2b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "79a90154a3fcfaf7e9f7214590dee318139220dbaed7b365a04befa652cfac4c"
    sha256 cellar: :any,                 x86_64_linux:  "6d4c521421a05272618f88dec7e4b28b35d19da113252cbde855eee6f315fbec"
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
