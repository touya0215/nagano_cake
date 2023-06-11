class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order_addresses = current_customer.addresse
  end

  def complete
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:order).permit(:item_id, :customer_id, :amount )
  end


end
