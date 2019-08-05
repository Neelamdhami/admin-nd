class CartsController < ApplicationController

  def add_to_cart_item

    #binding.pry

      @product = Product.find(params[:product_id])

    cart = Cart.find_or_create_by(user_id: current_user.id)
    cart_items = CartItem.where(cart_id: cart.id, product_id: params[:product_id],status: "IN CART")

    if cart_items.any?
        ci = cart_items.first
        ci.quantity = ci.quantity + 1

        ci.save
        
      else
        CartItem.create(status: "IN CART",cart_id: cart.id, product_id: params[:product_id],quantity: 1, price: @product.price)
      end

      redirect_to products_path
  end

  def cart_item

    @cart_item = CartItem.where(status: "IN CART")
    

    @item_quantity = @cart_item.map(&:quantity).sum

    #@item_price = @cart_item.map(&:price).sum
    
          

  end

  def increse_decrease_quantity

     if params[:status] == "increment"
    @cart_item = CartItem.find(params[:cart_item_id]) 
    @cart_item.quantity = @cart_item.quantity + 1
    @cart_item.price = @cart_item.quantity*@cart_item.product.price
    @cart_item.save
   else
    @cart_item = CartItem.find(params[:cart_item_id]) 
    @cart_item.quantity = @cart_item.quantity - 1
    @cart_item.price = @cart_item.quantity*@cart_item.product.price
    @cart_item.save

   end
    redirect_to "/carts/cart_item"
   #render json: {total: "200"}
  end

  

 #params[:cart_item_id]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    id = params[:id]
    CartItem.find(id).delete
    redirect_to cart_item_carts_path
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
   

     end


    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id)
    end
#end

