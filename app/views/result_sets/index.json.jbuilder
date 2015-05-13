json.array!(@result_sets) do |result_set|
  json.extract! result_set, :id, :name, :date, :version, :status
  json.url result_set_url(result_set, format: :json)
end
