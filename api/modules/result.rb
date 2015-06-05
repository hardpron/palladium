module Resource
module Result
  # api/results/get_all_results
  # @return [String] with all results data. Use +JSON.parse string+ to convert it to hash
  def get_all_results
    send_get_request('results/get_all_results', {:user_email => @username, :user_token => @token})
  end

  # api/results/add_new_result
  # @param params [Hash] with result data, result_set id and status_id.
  # @return [String] with established data
  # Example:
  # {:result => {:message => "Message",
  #              :author => "Futhor"},
  #  :status_id => 'Status_id',
  #  :result_set_id => 'Result_set_id'}
  # => "{"id":12250,"message":"message124991534","author":"author125008110","result_set_id":6239,"status_id":1,"created_at":"2015-06-05T13:44:28.136Z","updated_at":"2015-06-05T13:44:28.150Z"}"
  # You can change only Message, Futhor and Status_id (data type - string) and change Result_set_id
  def add_new_result(params)
    params.merge!({:commit => 'Create Result'})
    response = send_post_request('results/add_new_result', params)
    response.body
  end

  def edit_result(params)
    params.merge!({:commit => 'Update Result Set'})
    response = send_post_request('results/update_result', params)
    response.body
  end


  # api/results/update_result
  # @param params [Hash] with result data.
  # Example:
  # {:result => {:message => "Message",
  #              :author => "Futhor"},
  #  :id => 'id'}
  # => "{"id":6179,"name":"name_after_edit278619558","date":"date250119125","version":"version250060107","status":null,"run_id":2330,"created_at":"2015-06-03T14:19:19.261Z","updated_at":"2015-06-03T14:19:19.291Z"}"
  # You can change only Message and Futhor (data type - string) for result with any id
  def edit_result_set(params)
    params.merge!({:commit => 'Update Result Set'})
    response = send_post_request('result_sets/update_result_set', params)
    response.body
  end
end
end
