json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :description, :meta_tag_title, :meta_tag_description, :meta_tag_keywords
  json.url product_url(product, format: :json)
end
