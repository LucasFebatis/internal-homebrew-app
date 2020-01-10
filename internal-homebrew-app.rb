class MyDownloadStrategy < GitDownloadStrategy
  def fetch
    # downloads output to `temporary_path`
    require 'uri'
    require 'net/http'

    url = URI("https://api.github.com/repos/LucasFebatis/internal-homebrew-app/contents/archive/main.tar.gz")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["Accept"] = 'application/vnd.github.v3.raw'
    request["Authorization"] = 'token 95fc9f932befdaa34fccc78e46b65a2c8c29165e'
    request["User-Agent"] = 'PostmanRuntime/7.20.1'
    request["Cache-Control"] = 'no-cache'
    request["Postman-Token"] = '02a202ba-3c22-4350-b508-4342bebcc397,ece5353b-2b82-4daf-87fc-68f5ce3adfaf'
    request["Host"] = 'api.github.com'
    request["Accept-Encoding"] = 'gzip, deflate'
    request["Cookie"] = '_octo=GH1.1.341585226.1578605035'
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
