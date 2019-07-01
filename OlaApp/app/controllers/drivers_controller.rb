# frozen_string_literal: true

class DriversController < ApplicationController
  def index; end

  def new; end

  def show

 	@driver = DriverDetail.where(user_id:current_user.id)
  	@ride =	Ride.where(driver_detail_id:@driver.ids).last
  	@ride.status="completed"
  	@driver.status="Avaiable"
  	@driver.save
  	@ride.save
  	
   end

  def edit; end

  def accept_ride
  	
  	@driver = DriverDetail.where(user_id:current_user.id)
  	@ride =	Ride.where(driver_detail_id:@driver.ids).last
  	@ride.status="running"
  	@driver.status="Occupied"
  	@driver.save
  	if @ride.save
  		redirect_to ride_path(current_user.id) 
  	end

  end


  def ride_request
		  @driver = DriverDetail.where(user_id:current_user.id).ids
   	@ride =	Ride.where(driver_detail_id:@driver).last
   	
   	@customer = User.where(id:@ride.user_id).first

   end
end
