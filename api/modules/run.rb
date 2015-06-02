module Resource
module Run
  # api/runs/get_all_runs
  # @return [String] with all runs data. Use +JSON.parse string+ to convert it to hash
  def get_all_runs
    send_get_request('runs/get_all_runs', {:user_email => @username, :user_token => @token})
  end
  #
  # # api/runs/get_runs_by_param
  # # @return [String] with plans data. Use +JSON.parse string+ to convert it to hash
  def get_runs_by_param(param)
    raise('Method get_runs_by_param get hash with one pair keys and values') unless param.keys.size == 1
    param = {param.keys.first.to_s => param.values.first.to_s}
    send_get_request('runs/get_runs_by_param', {:user_email => @username, :user_token => @token, :param => param})
  end
  alias_method :get_run_by_param, :get_runs_by_param
  #
  # api/runs/add_new_run
  # @param params [Hash] with run data and product id.
  # @return [String] with established data
  # Example:
  # {:run => {:name => "Run_name",
  #           :version => "Version"}
  # :plan_id = "1"}
  # => "{"id":2102,"name":"Run_name","version":"Version","plan_id":715,"created_at":"2015-06-02T15:10:16.057Z","updated_at":"2015-06-02T15:10:16.063Z"}"
  # You can change only Run_name and Version (data type - string) and change plan_id
  def add_new_run(params)
    params.merge!({:commit => 'Create Run'})
    response = send_post_request('runs/add_new_run', params)
    response.body
  end
  #
  # # api/plans/update_plan
  # # @param params [Hash] with product data.
  # # Example:
  # # {:plan => {:name => "Plan_name",
  # #            :version => "Version"}
  # # :id => "1"}
  # # Change  Plan_name and Version (data type - string) for plan with any id
  # def edit_plan(params)
  #   params.merge!({:commit => 'Update Plan'})
  #   send_post_request('plans/update_plan', params)
  # end
  #
  # # api/plans/delete_plan
  # # @param params [Hash] with plan id.
  # # Example:
  # # {:id => "1"}
  # # ATTENTION!!! Plan, and all its runs, set-results and results will be deleted!! Dont use this method inattentively
  # def delete_plan(params)
  #   send_post_request('plans/delete_plan', params)
  # end
end
end
