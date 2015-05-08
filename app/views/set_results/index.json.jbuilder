json.array!(@set_results) do |set_result|
  json.extract! set_result, :id
  json.url set_result_url(set_result, format: :json)
end
