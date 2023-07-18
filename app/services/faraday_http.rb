class FaradayHttp
  require 'faraday'

  def initialize(url:)
    @client = Faraday.get(url)
  end

  def client
    @client
  end
end