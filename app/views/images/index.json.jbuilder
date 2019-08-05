json.array!(@images) do |image|
  json.extract! image, :id, :image_preview, :image_url, :sort_order
  json.url image_url(image, format: :json)
end
