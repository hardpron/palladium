require 'net/http'
require_relative 'modules/product'
class Api
  include Product

  def initialize(address, username, token)
    @uri = URI.parse("http://#{address}/api/products/get_products")
    @username = username
    @token = token
  end
end

#Example
api = Api.new('localhost:3000', 'flamine@list.ru', '4s8Fq325PJmsD1frVSHx')
api.get_all_products