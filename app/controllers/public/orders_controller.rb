class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def complete
    # 表示するだけなので記入無し。
  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order.shipping_cost = 800
    @order_details = @order.order_details
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save!
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = @order.total_payment
      @order_detail.amount = cart_item.amount
      @order_detail.save!
    end
    @cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def comfirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.total_payment = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
      if params[:order][:address_number] == "1"
        @order.name = current_customer.last_name + current_customer.first_name # @order の各カラムに必要なものを入れます
        @order.address = current_customer.address
        @order.postal_code = current_customer.postal_code

      elsif params[:order][:address_number] == "2"
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code

      elsif params[:order][:address_number] == "3"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      else
        redirect_to cart_items_path#遷移したいページ # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
      end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :postal_code, :shipping_cost, :total_payment )
  end


end
