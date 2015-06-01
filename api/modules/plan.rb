module Resource
module Plan
  # api/products/get_products_by_param
  def get_all_plans
    send_get_request('plans/get_plans', {:user_email => @username, :user_token => @token})
  end
  #
  def get_plans_by_param(param)
    raise('Method get_plans_by_param get hash with one pair keys and values') unless param.keys.size == 1
    param = {param.keys.first.to_s => param.values.first.to_s}
    send_get_request('plans/get_plans_by_param', {:user_email => @username, :user_token => @token, :param => param})
  end

  # api/products/add_new_product
  def get_plans_by_param(params)
    params.merge!({:commit => 'Create Plan'})
    send_post_request('plans/add_new_plan', params)
  end
  #
  # # api/products/update_product
  # # params = {:product => {:name => "name1", :status => "status", :version => "version"}, :id => "14"}
  # def edit_product(params)
  #   params.merge!({:commit => 'Update Product'})
  #   send_post_request('products/update_product', params)
  # end
  #
  # # api/products/delete_product
  # def delete_product(id)
  #   send_post_request('products/delete_product', {:id => id})
  # end
end
end
