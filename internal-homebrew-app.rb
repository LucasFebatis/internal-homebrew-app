class InternalHomebrewApp < Formula
  desc "A command line tool to retrieve local weather"
  homepage "https://github.com/LucasFebatis/internal-homebrew-app"
  url "https://github.com/LucasFebatis/internal-homebrew-app/blob/master/archive/main.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "3074ad54256717041c9006a874988d04a30a92941cac796507889538612c47b9"
  version "1.0.0"

  depends_on "curl"

  bottle :unneeded

  def install
    bin.install "weather"
  end
end
