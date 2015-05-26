json.array!(@products) do |product|
  json.extract! product, :id, :name, :status, :version
  json.url product_url(product, format: :json)
end
