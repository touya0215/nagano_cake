class Admins::ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path
  end

  def index
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "You have updated item successfully."
      redirect_to admins_items_path
    else
      render :new
    end
  end

  private


  def item_params
    params.require(:item).permit(:name, :image_id, :introduction, :genre_id, :is_active, :price)
  end

end
