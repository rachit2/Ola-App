class RideController < ApplicationController

def create
  
   @user=current_user
  @fare=0
   @ride=@user.rides.build(ride_params) 
  @coupon = Coupon.all 

    @coupon.each do |coupon|
    if( coupon.description == params[:ride][:coupon_code])
    
  
        @ride.coupon_id=coupon.id
      break
    end
  end



    
  @cab=Cab.all
    @cab.each do |cab|
     
      if(cab.cab_type==params[:ride][:cab])
        
        if(params[:ride][:distance]==0)
          @fare=cab.minimum_charge
        else
          @fare=cab.rate_per_km * params[:ride][:distance].to_i
        end
        break
      end
    end     


     if @ride.save
    redirect_to :action => "show", :id => current_user.id, :fare=>@fare
    #render :show , locals: {:id=>current_user.id, :fare=>@fare}
     end

end

private
  def ride_params
    params.require(:ride).permit(:coupon_id,:pickup_point,:drop_point,:distance,:wait_time,:start_time,:end_time,:fare)
  end



def index
end

def new
  @ride=Ride.new
end


def show
end

end