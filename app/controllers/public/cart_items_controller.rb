class Public::CartItemsController < ApplicationController

  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    @cart_items.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    @cart_items.save
    redirect_to cart_items_path
  end

  private


  def cart_item_params
    # params.require(:cart_item).permit(:item_id, :customer_id, :amount )
    params.permit(:item_id, :customer_id, :amount )
  end

end
