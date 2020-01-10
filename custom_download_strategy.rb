require "download_strategy"

# GitHubPrivateRepositoryDownloadStrategy downloads contents from GitHub
# Private Repository. To use it, add
# `:using => :github_private_repo` to the URL section of
# your formula. This download strategy uses GitHub access tokens (in the
# environment variables `HOMEBREW_GITHUB_API_TOKEN`) to sign the request.  This
# strategy is suitable for corporate use just like S3DownloadStrategy, because
# it lets you use a private GitHub repository for internal distribution.  It
# works with public one, but in that case simply use CurlDownloadStrategy.
class CustomGitPrivateRepositoryDownloadStrategy < CurlDownloadStrategy
  require 'uri'
  require 'net/http'

  def initialize(url, name, version, **meta)
    super
    Kernel.system 'curl --user user:pass https://bitbucket.org/lucasbatistafcamara/private-tap/src/master/archive/main.tar.gz >main.tar.gz' 
    # download_url
    # parse_url_pattern
    # set_github_token
  end

  def download_url
    #"https://#{@github_token}@api.github.com/repos/#{@owner}/#{@repo}/releases/assets/#{asset_id}"
    #blah = curl_output "--header", "Accept: application/octet-stream", "--header", "Authorization: token #{@github_token}", "-I"
    uri = URI("https://api.github.com/repos/LucasFebatis/internal-homebrew-app/contents/archive/main.tar.gz")
    req = Net::HTTP::Get.new(uri)
    req['Accept'] = 'application/vnd.github.v3.raw'
    req['Authorization'] = "token #{@github_token}"

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(req)
    end

    res['location']
  end
end