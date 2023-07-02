class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order.shipping_cost = 800
    @order_details = @order.order_details
  end
end
