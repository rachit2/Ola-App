# frozen_string_literal: true
class RideController < ApplicationController
  def create
    @user = current_user
    @fare = 0
    @amt = 0
    @ride = @user.rides.build(ride_params)
    @coupon = Coupon.all

    @coupon.each do |coupon|
      if coupon.description == params[:ride][:coupon_code]
        @ride.coupon_id = coupon.id
        break
      end
    end
    @cab = Cab.all
    @cab.each do |cab|
      next unless cab.cab_type == params[:ride][:cab]

      @fare = if params[:ride][:distance] == 0
                cab.minimum_charge
              else
                cab.rate_per_km * params[:ride][:distance].to_i
              end
      break
    end
    @amt = if @ride.coupon_id == 2
             @fare - @fare * 1 / 2
           else
             @fare
           end

        
    @city=Circle.where(city_id:current_user.city_id)
    @circle=@city.where(name:params[:ride][:pickup_point]).pluck(:id)
    @cab=CabDetail.where(circle_id:@circle).pluck(:user_id)
    
    @user=User.where(id:@cab).first
    @driver=DriverDetail.where(status:"Available",user_id:@user.id).pluck(:id).first
    @ride.driver_detail_id = @driver
    @ride.status = "pending"
    
    if @ride.save
      redirect_to action: 'show', id: current_user.id, fare: @fare, amt: @amt
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:coupon_id, :pickup_point, :drop_point, :distance, :wait_time, :start_time, :end_time, :fare)
  end

  def index

   end

  def new
    @ride = Ride.new
  end

  def show; end
end