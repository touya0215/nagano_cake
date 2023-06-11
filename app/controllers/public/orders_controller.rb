class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresse
  end

  def complete
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:order).permit(:postal_code, :address, :name )
  end


end
