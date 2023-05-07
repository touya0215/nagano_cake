class Admins::CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def show
    @customer = Customer.new
    @customers = Customer.find(params[:id])
  end

  def edit
  end
end
