json.array!(@runs) do |run|
  json.extract! run, :id, :date, :version, :status
  json.url run_url(run, format: :json)
end
