json.array!(@discounts) do |discount|
  json.extract! discount, :id, :group, :quantity, :discount, :date_start, :date_end
  json.url discount_url(discount, format: :json)
end
