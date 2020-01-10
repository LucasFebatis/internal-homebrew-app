class MyDownloadStrategy < GitDownloadStrategy
  def fetch
    # downloads output to `temporary_path`
    require 'uri'
    require 'net/http'

    url = URI("https://github.com/LucasFebatis/internal-homebrew-app/blob/master/archive/main.tar.gz")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'token 95fc9f932befdaa34fccc78e46b65a2c8c29165e'
    request["Accept-Encoding"] = 'gzip, deflate'
    request["Connection"] = 'keep-alive'
    request["cache-control"] = 'no-cache'

    response = http.request(request)
    puts response.read_body

  end
end

class InternalHomebrewApp < Formula
  desc "A command line tool to retrieve local weather"
  homepage "https://github.com/LucasFebatis/internal-homebrew-app.git"
  url "https://github.com/LucasFebatis/internal-homebrew-app/blob/master/archive/main.tar.gz", :using => MyDownloadStrategy
  sha256 "3074ad54256717041c9006a874988d04a30a92941cac796507889538612c47b9"
  version "1.0.0"

  depends_on "curl"
  depends_on "git"

  bottle :unneeded

  def install
    bin.install "weather"
  end
end
