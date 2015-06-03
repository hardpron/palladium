module Resource
module Result
  # api/results/get_all_results
  # @return [String] with all results data. Use +JSON.parse string+ to convert it to hash
  def get_all_results
    send_get_request('results/get_all_results', {:user_email => @username, :user_token => @token})
  end

end
end
