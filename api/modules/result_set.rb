module Resource
module ResultSet
  # api/result_set/get_all_result_sets
  # @return [String] with all result_sets data. Use +JSON.parse string+ to convert it to hash
  def get_all_result_sets
    send_get_request('result_sets/get_all_result_sets', {:user_email => @username, :user_token => @token})
  end
end
end
