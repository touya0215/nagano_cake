class Admins::CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def show
    @customer = Customer.new
    @customers = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.new
    @customers = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "You have updated item successfully."
      redirect_to admins_customer_path
    else
      render :show
    end
  end
  
  
   private


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, :postal_code, :address, :telephone_number)
  end

  
end
