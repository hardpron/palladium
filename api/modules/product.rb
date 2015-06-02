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
  # api/products/get_products_by_param
  # @return [String] with all products data. Use +JSON.parse string+ to convert it to hash
  def get_all_products
    send_get_request('products/get_products', {:user_email => @username, :user_token => @token})
  end

  # api/products/get_products_by_param
  # @return [String] with products data. Use +JSON.parse string+ to convert it to hash
  def get_products_by_param(param)
    raise('Method get_products_by_param get hash with one pair keys and values') unless param.keys.size == 1
    param = {param.keys.first.to_s => param.values.first.to_s}
    send_get_request('products/get_products_by_param', {:user_email => @username, :user_token => @token, :param => param})
  end

  # api/products/add_new_product
  # @param params [Hash] with product data.
  # Example:
  # {:product => {:name => "Product_name",
  #               :status => "Status",
  #               :version => "Version"}}
  # You can change only Product_name, Status and Version (data type - string)
  def add_new_product(params)
    params.merge!({:commit => 'Create Product'})
    send_post_request('products/add_new_product', params)
  end

  # api/products/update_product
  # @param params [Hash] with product data.
  # Example:
  # {:product => {:name => "Product_name",
  #               :status => "Status",
  #               :version => "Version"}
  # :id => "1"}
  # Change  Product_name, Status and Version (data type - string) for product with any id
  def edit_product(params)
    params.merge!({:commit => 'Update Product'})
    send_post_request('products/update_product', params)
  end

  # api/products/delete_product
  # @param params [Hash] with product id.
  # Example:
  # {:id => "1"}
  # ATTANTION!!! Product, and all its plans, runs, set-results and results will be deleted!! Dont use this method inattentively
  def delete_product(params)
    send_post_request('products/delete_product', params)
  end
end
end
