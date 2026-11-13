class Vdf < Formula
  desc "Visual disk free: df -h with colour-gradient bars, grouped by physical disk"
  homepage "https://github.com/jggonz/vdf"
  version "1.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/jggonz/vdf/releases/download/v1.0.0/vdf-1.0.0-macos-universal.tar.gz"
    sha256 "d231846527c5dfcaf9483ff3ffda1ec9b29362d48d4849a45ec4f3ae3b14b34e"
  end

  on_linux do
    on_intel do
      url "https://github.com/jggonz/vdf/releases/download/v1.0.0/vdf-1.0.0-linux-x86_64.tar.gz"
      sha256 "9b6822a25fdd79e83201c5d305867fd9948dd745d2516c2b4add8c8665aab2e6"
    end
    on_arm do
      url "https://github.com/jggonz/vdf/releases/download/v1.0.0/vdf-1.0.0-linux-aarch64.tar.gz"
      sha256 "a9d4314804cb910537b1b9e0769304e825d0f52ec4109d0e17c77c522b663ee1"
    end
  end

  def install
    bin.install "vdf"
    man1.install "vdf.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vdf --version")
    assert_match "Mounted on", shell_output("#{bin}/vdf --flat --color never /")
  end
end
