module Resource
module Run
  # api/runs/get_all_runs
  # @return [String] with all runs data. Use +JSON.parse string+ to convert it to hash
  def get_all_runs
    send_get_request('runs/get_all_runs', {:user_email => @username, :user_token => @token})
  end

  # # api/runs/get_runs_by_param
  # # @return [String] with run data. Use +JSON.parse string+ to convert it to hash
  def get_runs_by_param(param)
    raise('Method get_runs_by_param get hash with one pair keys and values') unless param.keys.size == 1
    param = {param.keys.first.to_s => param.values.first.to_s}
    send_get_request('runs/get_runs_by_param', {:user_email => @username, :user_token => @token, :param => param})
  end
  alias_method :get_run_by_param, :get_runs_by_param

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
end
end
