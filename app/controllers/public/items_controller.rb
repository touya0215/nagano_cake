class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end

  def show
    @item = Item.new
    @items = Item.find(params[:id])
  end
  
  
end
