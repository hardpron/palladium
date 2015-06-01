module Resource

  def send_get_request(path, params = {})
    local_uri = get_local_uri(path)
    local_uri.query = URI.encode_www_form(params)
    Net::HTTP.get_response(local_uri).body
  end

  def send_post_request(path, params)
    local_uri = get_local_uri(path)
    req = Net::HTTP::Post.new(local_uri, initheader = {'Content-Type' =>'application/json'})
    req.add_field('X-User-Email', @username)
    req.add_field('X-User-Token', @token)
    req.add_field('commit', 'Create Product')
    req.body = params.to_json
    res = Net::HTTP.new(local_uri.host, local_uri.port).start do |http|
      http.request(req)
    end
    res
  end

  def get_local_uri(path)
    local_uri = @uri.clone
    local_uri.path += path
    local_uri
  end

module Product
  # api/products/get_products
  def get_all_products
    send_get_request('products/get_products', {:user_email => @username, :user_token => @token})
  end

  # api/products/add_new_product
  def add_new_product(name, version, status = '')
    send_post_request('products/add_new_product', {:product => {:name => name, :status => status, :version => version}})
  end
end
end
# "product"=>{"name"=>"1", "status"=>"11", "version"=>"111"}, "commit"=>"Create Product"

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