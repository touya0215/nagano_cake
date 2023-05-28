class Public::CartItemsController < ApplicationController

  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    @cart_items.save
    redirect_to cart_items_path
  end

  def index
  end

  private


  def cart_item_params
    params.permit(:item_id, :customer_id, :amount )
  end

end
