# frozen_string_literal: true

class CustomerController < ApplicationController
	include HTTParty

  def index; end

  def create; end

  def show
    #@customer = User.find(current_user.id)
 @ride = Ride.all.select { |m| m.user_id == current_user.id }
  end

  def update
    @customer = current_user.id
    if @customer.update(customer_params)
      redirect_to customer_path, id: current_user.id
    else
      render 'edit'
    end
  end

  def edit
    @customer = User.find(current_user.id)
  end

  private

  def customer_params
    params.require(:user).permit(:name, :email, :mobile, :address, :city)
  end
end