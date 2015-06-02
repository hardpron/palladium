module Resource
module Plan
  # api/plans/get_products_by_param
  def get_all_plans
    send_get_request('plans/get_plans', {:user_email => @username, :user_token => @token})
  end

  # api/plans/get_plans_by_param
  def get_plans_by_param(param)
    raise('Method get_plans_by_param get hash with one pair keys and values') unless param.keys.size == 1
    param = {param.keys.first.to_s => param.values.first.to_s}
    send_get_request('plans/get_plans_by_param', {:user_email => @username, :user_token => @token, :param => param})
  end
  alias_method :get_plan_by_param, :get_plans_by_param

  # api/plans/add_new_product
  def add_new_plan(params)
    params.merge!({:commit => 'Create Plan'})
    send_post_request('plans/add_new_plan', params)
  end

  # # api/plans/update_product
  # # params = {:product => {:name => "name1", :status => "status", :version => "version"}, :id => "14"}
  def edit_plan(params)
    params.merge!({:commit => 'Update Plan'})
    send_post_request('plans/update_plan', params)
  end

  # api/plans/delete_product
  def delete_plan(id)
    send_post_request('plans/delete_plan', {:id => id})
  end
end
end
