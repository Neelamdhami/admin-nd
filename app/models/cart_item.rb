class CartItem < ActiveRecord::Base

	belongs_to :product
	belongs_to :cart
	belongs_to :user
	#belongs_to :orders
end
