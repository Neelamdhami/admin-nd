json.array!(@data) do |datum|
  json.extract! datum, :id, :model, :location, :Tax, :class, :quantity, :minimum_quantity, :sort_order, :status
  json.url datum_url(datum, format: :json)
end
