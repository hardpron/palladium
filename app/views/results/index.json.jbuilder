json.array!(@results) do |result|
  json.extract! result, :id, :status, :author, :message
  json.url result_url(result, format: :json)
end
