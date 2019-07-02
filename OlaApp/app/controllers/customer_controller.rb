# frozen_string_literal: true

class CustomerController < ApplicationController
	include HTTParty

  def index; end

  def create; end


  def book_a_cab
    @driver=DriverDetail.where(status:"Available").pluck(:id).first
  end



  def show
    #@customer = User.find(current_user.id)
 @ride = Ride.all.select { |m| m.user_id == current_user.id }
  end

 def update
 @customer = User.find(current_user.id)
 @customer.city_id = City.where(["name = ?", params[:user][:city]]).pluck("id").first
   if @customer.update(customer_params)
   	 flash[:alert] = "Details Updated!"
   	 redirect_to :action => :show
   else
     flash[:alert] = "Details Not Updated!"
     render 'show'
   end
end

  def edit
    @customer = User.find(current_user.id)
  end

  private

  def customer_params
    params.require(:user).permit(:name, :email, :mobile, :address)
  end
end
