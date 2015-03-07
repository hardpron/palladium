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

  def create_product(product_name, current_status, version)
    send_post_request({'act' => 'create_product', 'name' => product_name.to_s, 'status' => current_status.to_s, 'version' => version.to_s})
  end
end
# g = Generator.new
# 10.times {g.create_product('11', '11', '11')}
