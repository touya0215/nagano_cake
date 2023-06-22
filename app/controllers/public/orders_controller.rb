class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def complete

  end

  def index
  end

  def show
  end

  def comfirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
      if params[:order][:address_number] == "1"
        @order.name = current_customer.last_name + current_customer.first_name # @order の各カラムに必要なものを入れます
        @order.address = current_customer.address
        @order.postal_code = current_customer.postal_code

      elsif params[:order][:address_number] == "2"
          @order.name = Address.find(params[:order][:address_id]).name
          @order.address = Address.find(params[:order][:address_id]).address
          @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      else
        redirect_to cart_items_path#遷移したいページ # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
      end
  end

  def create

  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :postal_code, :shipping_cost, :total_payment )
  end

  def address_params
  params.require(:order).permit(:name, :address)
  end

end
