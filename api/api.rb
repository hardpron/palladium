require 'net/http'
require_relative 'modules/product'
require_relative 'modules/plan'
require 'json'
class Api
  include Resource
  include Product
  include Plan

  def initialize(address, username, token)
    @uri = URI("http://#{address}/api/")
    @username = username
    @token = token
  end
end

#Example
# api = Api.new('localhost:3000', 'flamine@list.ru', '4s8Fq325PJmsD1frVSHx')
# api.add_new_product('name3', 'version3', 'status3')
# api.get_all_products
# p