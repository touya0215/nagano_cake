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
    @customers = Customers.find(params[:id])
    if @customers.update(customer_params)
      flash[:notice] = "You have updated item successfully."
      redirect_to customers_customers_show_path(params[:id])
    else
      render :show
    end
  end


   private


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, :postal_code, :address, :telephone_number)
  end


end
