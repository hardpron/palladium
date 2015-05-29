module Product
  def get_all_products
    params = { :user_email => @username, :user_token => @token }
    @uri.query = URI.encode_www_form(params)
    Net::HTTP.get_response(@uri).body
  end
end

# req = Net::HTTP::Post.new(@uri)
# req.add_field('X-User-Email', @username)
# req.add_field('X-User-Token', @token)
# req.add_field('products', [])
#
# res = Net::HTTP.new(@uri.host, @uri.port).start do |http|
#   http.request(req)
# end
#
# puts res.body