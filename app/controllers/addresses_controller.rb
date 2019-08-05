class AddressesController < ApplicationController
	before_action :authenticate_user!
	def new
	@address = Address.new
	@addresses = current_user.addresses


	end

	def index

    @addresses = Address.all

  end
   def show
   	@address = Address.find(params[:id])

   end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])
 
 	  @address.update(addresses_params)
     	redirect_to @address

  end

  def addressdelete
    @address = Address.find(params[:address_id])
     @address.destroy

  end

	def create

	@address = current_user.addresses.new(addresses_params)
	#@address = Address.new(addresses_params)
 	@address.save
  	redirect_to new_address_path
  	end


 private
   def addresses_params
   		params.require(:address).permit(:name, :pincode, :house_no, :city, :state, :mobile_no )
   end
end
