class Cart < ActiveRecord::Base
 has_many :cart_items
	# belong_to :user
end
