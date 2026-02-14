class Dsync < Formula
  desc "Database migration and synchronization tool"
  homepage "https://adiom.io"
  url "https://github.com/adiom-data/dsync/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "79103cb24f3936047c43e1b81361fdaf60b8495d21329b9d743c792408596b6c"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/adiom-data/homebrew-tap/releases/download/dsync-0.23.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2abcfed7c98db686ed66f9c7482c2fa33e33f9749fb971f994a43282928b403f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e4fffc9ae6df945ed3908db897b86c25e33eba78e769a9fe04bb221f3bb0b5d6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cdbdf262477d64aae432a0fe4c3e0121ffd2ec3173090c8a2749de5d53b9dc91"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "020e8f965d036d29a960a97b788ac1de3ffc4027ed715aece03a78ec9c018df4"
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
