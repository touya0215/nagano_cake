class Admins::HomesController < ApplicationController
  def top
    @order = Order.all.page(params[:page]).per(10).order(created_at: :desc)
  end
end
