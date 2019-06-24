class RideController < ApplicationController

def create
 
   @user=current_user
   @ride=@user.rides.build(ride_params)
  @coupon = Coupon.all 

    @coupon.each do |coupon|
    if( coupon.description == params[:ride][:coupon_code])
    byebug
  
        @ride.coupon_id=coupon.id
      break
    end
  end

    if @ride.save
      redirect_to :action => "show", :id => current_user.id
    end

end

private
  def ride_params
    params.require(:ride).permit(:coupon_id,:pickup_point,:drop_point,:distance,:wait_time,:start_time,:end_time)
  end



def index
end

def new
  @ride=Ride.new
end


def show
end

end