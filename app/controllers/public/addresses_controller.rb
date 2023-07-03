class Public::AddressesController < ApplicationController

  def create
    @addresse = Address.new(addresse_params)
    @addresse.customer_id = current_customer.id
    @addresse.save
    redirect_to addresses_path
  end

  def index
    @addresses = Address.new
    @addressess = current_customer.addresses
  end

  def edit
    @addresses = Addresse.new
    @addressess = Addresse.find(params[:id])
  end

  def update
    @addressess = Addresse.find(params[:id])
    @addressess.update(addresse_params)
    redirect_to addresses_path
  end

  def destroy
    @addresses = Addresse.find(params[:id])
    @addresses.destroy
    redirect_to addresses_path
  end

  private


  def addresse_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
