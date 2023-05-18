class Public::CustomersController < ApplicationController

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to public_customer_path(@customer[:id])
  end

  def show
    @customer = Customer.new
    @customers = current_customer

  end

  def edit
    @customer = Customer.new
    @customers = Customer.find(params[:id])
  end

  def unsubscribe
  end

  def update
    @customers = Customer.find(params[:id])
    @customers.update(customer_params)
    redirect_to customer_path(params[:id])
  end

  def destroy
    @customers = Customer.find(params[:id])
    @customers.destroy!
    redirect_to customers_homes_top_path
  end

  private


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, :postal_code, :address, :telephone_number)
  end

end
