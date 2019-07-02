# frozen_string_literal: true

class DriversController < ApplicationController
  def index; end

  def new; end


	def update
	  @driver = current_user.id
	 
	  if @driver.update(params)
	    redirect_to @driver
	  else
	    render 'edit'
	  end
	end

  def show
 	@driver = DriverDetail.where(user_id:current_user.id).first
  	@ride =	Ride.where(driver_detail_id:@driver.id).last
  	@ride.status="completed"
  	@driver.status="Avaiable"
  	@driver.save
  	@ride.save
  end

  def edit
		@driver = User.find(params[:id])
	
   end

  def accept_ride
  	
  	@driver = DriverDetail.where(user_id:current_user.id).first
  	@ride =	Ride.where(driver_detail_id:@driver.id).last
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
   		
   		if @ride.present? && @ride.status=="Pending"
   			@customer = User.where(id:@ride.user_id).first
   		else
   			 flash[:alert] = "No Ride Requests!"
   			render :action => :index
   		end
   end
end
