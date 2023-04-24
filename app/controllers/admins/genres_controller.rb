class Admins::GenresController < ApplicationController

  def create
    @genre = Genre.new(genre_params)
    #@genre.user_id = current_admin.id
    @genre.save
    redirect_to admins_genres_index_path
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update!(genre_params)
      flash[:notice] = "You have updated genre successfully."
      redirect_to admins_genres_path
    else
      render :index
    end
  end

  private


  def genre_params
    params.require(:genre).permit(:name)
  end


end
