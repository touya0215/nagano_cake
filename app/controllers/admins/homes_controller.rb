class Admins::HomesController < ApplicationController
  def top
    @order = Order.page(params[:page]).per(10).order(created_at: :desc)
  end
end
