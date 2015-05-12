json.array!(@result_sets) do |result_set|
  json.extract! result_set, :id, :status, :version
  json.url result_set_url(result_set, format: :json)
end
