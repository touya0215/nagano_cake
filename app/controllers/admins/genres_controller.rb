class Admins::GenresController < ApplicationController

  def create
    @admin = Admin.new(admin_params)
    @admin.user_id = current_admin.id
    @admin.save
  end

  def index
  end

  def edit
  end
end
