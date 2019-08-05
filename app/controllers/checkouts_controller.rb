class CheckoutsController < ApplicationController
	before_action :authenticate_user!

def review_order
	@cart_item = CartItem.where(status: "IN CART")

    @item_quantity = @cart_item.map(&:quantity).sum

    #@item_price = @cart_item.map(&:price).sum
   
    @address = current_user.addresses.find_by(id: params[:address_id])



end


def make_payment
	@cart_item = current_user.cart_items.where(status: "IN CART")

    @item_quantity = @cart_item.map(&:quantity).sum
    @address = current_user.addresses.find_by(id: params[:address_id])

end

def make_order
  
  @order = current_user.orders.new(address_id: params[:address_id])
	
	@order.save
  @cart_items = current_user.cart_items.where(status: "IN CART")
  @cart_items.each do | cart_item |
    @order_item = OrderItem.new(cart_item_id: cart_item.id, order_id: @order.id)
    @order_item.save

  end
    @cart_items.update_all(status: "ORDERD")
    redirect_to products_path


end
   



def increase_decrease_quantityy

   #@cart_items = CartItem.find(param[:status])
   if params[:status] == "increment"
   	
    @cart_item = CartItem.find(params[:review_order_id]) 
    @cart_item.quantity = @cart_item.quantity + 1
    @cart_item.price = @cart_item.quantity*@cart_item.product.price
    @cart_item.save
   else
    @cart_item = CartItem.find(params[:review_order_id]) 
    @cart_item.quantity = @cart_item.quantity - 1
    @cart_item.price = @cart_item.quantity*@cart_item.product.price
    @cart_item.save

   end
    redirect_to "/checkouts/review_order"
   #render json: {total: "200"}
  end


end
