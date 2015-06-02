json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :version, :product_id
  json.url plan_url(plan, format: :json)
end
