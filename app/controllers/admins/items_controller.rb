class Admins::ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_item_path(@item[:id])
  end

  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.new
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    @items = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "You have updated item successfully."
      redirect_to admins_item_path
    else
      render :new
    end
  end

  private


  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :is_active, :price)
  end

end
