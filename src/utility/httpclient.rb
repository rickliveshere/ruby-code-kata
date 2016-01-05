
require 'open-uri'

class HttpClient
  def initialize()  
  end

  def download_string(uri)
    open(uri) { |io| io.read }
  end
end