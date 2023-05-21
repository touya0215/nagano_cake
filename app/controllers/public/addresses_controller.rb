class Public::AddressesController < ApplicationController

  def create
    @addresse = Addresse.new(addresse_params)
    @addresse.save
    redirect_to addresses_path
  end

  def index
    @addresses = Addresse.new
    @addressess = Addresse.all
  end

  def edit
    @addresses = Addresse.new
    @addressess = Addresse.find(params[:id])
  end
  
  def destroy
    @addresses = Addresse.find(params[:id])
    @addresses.destroy
    redirect_to addresses_path
  end

  private


  def addresse_params
    params.require(:addresse).permit(:name, :postal_code, :address)
  end

end
