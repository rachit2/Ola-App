class RideController < ApplicationController

def create
	byebug
	@ride = current_user.Ride.build(user_params)
  # @ride = Ride3.new(customer_params)
  byebug
   @ride.save
  redirect_to @ride
   	 
end
	def show
	end

private
  def customer_params
    params.require(:ride).permit(:from,:to, :fare, :distance, :user_id)
  end



end
