
class InternalHomebrewApp < Formula
  desc "A command line tool to retrieve local weather"
  homepage "https://github.com/LucasFebatis/internal-homebrew-app.git"
  url "https://github.com/LucasFebatis/internal-homebrew-app/blob/master/archive/main.tar.gz"
  sha256 "892a13975f129ebe3da13f5ccd358a2bd6918cb32580c0c67fe73aad3412a2eb"
  version "1.0.0"

  depends_on "curl"
  depends_on "git"

  bottle :unneeded

  def install
    bin.install "weather"
  end
end
