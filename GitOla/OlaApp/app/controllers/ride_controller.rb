# frozen_string_literal: true
class RideController < ApplicationController
  
  def create
    @user = current_user
    @fare = 0
    @amt = 0
    @ride = @user.rides.build(ride_params)
    @coupon=Coupon.where(description:params[:ride][:coupon_code]).pluck(:id).first
    @ride.coupon_id=@coupon
    @cab=Cab.where(cab_type:params[:ride][:cab]).first
    if(params[:ride][:distance]==0)
      @fare=@cab.minimum_charge
    else
      @fare=@cab.rate_per_km * params[:ride][:distance].to_i
    end
    @amt = if @ride.coupon_id == 2
             @fare - @fare * 1 / 2
           else
             @fare
           end
    @city=Circle.where(city_id:current_user.city_id)
    @circle=@city.where(name:params[:ride][:pickup_point]).pluck(:id)
    @cab_detail=CabDetail.where(circle_id:@circle).pluck(:user_id)
    # @user=User.where(id:@cab_detail)
    @driver=DriverDetail.where(status:"Available",user_id:@cab_detail).pluck(:id).first
    @ride.driver_detail_id = @driver
    
    if @driver.present?
      flash[:alert] = "Driver Assigned!"
     @ride.status = "pending"
     @ride.save
      redirect_to action: 'show', id: current_user.id, fare: @fare, amt: @amt
    else
        flash[:alert] = "Cab Not Available!"
        render template: 'customer/index'
    end
  end

  def index
      @city=City.where(id:current_user.city_id).pluck(:id)
      @circle= Circle.where(city_id:@city).pluck(:name)
   end

   def cancel_ride
    @ride=Ride.last   
    @ride.status='Cancelled'
    @ride.save
    flash[:alert] = "Ride Cancelled!"
    render template: 'customer/index'
   end

  def new
    @ride = Ride.new
  end

  def show; end

  private
  def ride_params
    params.require(:ride).permit(:coupon_id, :pickup_point, :drop_point, :distance, :wait_time, :start_time, :end_time, :fare)
  end

end