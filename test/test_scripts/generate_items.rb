require 'net/http'
#Generate diff requests for items create

class Generator
  @uri = nil

  def initialize(uri = 'http://127.0.0.1:3000')
    @uri = URI.parse uri
  end

  def send_post_request(body = {})
    Net::HTTP.post_form(@uri, body)
  end
end
# g = Generator.new
# g.send_post_request
