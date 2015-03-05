json.array!(@products) do |product|
  json.extract! product, :id, :name, :status, :version, :update_data
  json.url product_url(product, format: :json)
end
