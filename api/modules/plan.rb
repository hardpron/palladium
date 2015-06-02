module Resource
module Plan
  # api/plans/get_products_by_param
  # @return [String] with all plans data. Use +JSON.parse string+ to convert it to hash
  def get_all_plans
    send_get_request('plans/get_plans', {:user_email => @username, :user_token => @token})
  end

  # api/plans/get_plans_by_param
  # @return [String] with plans data. Use +JSON.parse string+ to convert it to hash
  def get_plans_by_param(param)
    raise('Method get_plans_by_param get hash with one pair keys and values') unless param.keys.size == 1
    param = {param.keys.first.to_s => param.values.first.to_s}
    send_get_request('plans/get_plans_by_param', {:user_email => @username, :user_token => @token, :param => param})
  end
  alias_method :get_plan_by_param, :get_plans_by_param

  # api/plans/add_new_plan
  # @param params [Hash] with plan data and product id.
  # Example:
  # {:plan => {:name => "Plan_name",
  #               :version => "Version"}
  # :product_id = "1"}
  # You can change only Plan_name and Version (data type - string) and change product_id
  def add_new_plan(params)
    params.merge!({:commit => 'Create Plan'})
    send_post_request('plans/add_new_plan', params)
  end

  # api/plans/update_plan
  # @param params [Hash] with product data.
  # Example:
  # {:plan => {:name => "Plan_name",
  #            :version => "Version"}
  # :id => "1"}
  # Change  Plan_name and Version (data type - string) for plan with any id
  def edit_plan(params)
    params.merge!({:commit => 'Update Plan'})
    send_post_request('plans/update_plan', params)
  end

  # api/plans/delete_plan
  # @param params [Hash] with plan id.
  # Example:
  # {:id => "1"}
  # ATTENTION!!! Plan, and all its runs, set-results and results will be deleted!! Dont use this method inattentively
  def delete_plan(params)
    send_post_request('plans/delete_plan', params)
  end
end
end
