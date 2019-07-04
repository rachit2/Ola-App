# frozen_string_literal: true

class DriversController < ApplicationController
  def index

   end

  def new
  end
	def update
	  @driver = current_user.id
	  if @driver.update(params)
	    redirect_to @driver
	  else
	    render 'edit'
	  end
	end

  def show
  	if params[:ride].present?
	 		@ride=Ride.find(params[:ride])
	  	@driver=DriverDetail.find(DriverDetail.where(user_id:params[:driver]).ids).first
	  	@ride.status="completed"
	  	@driver.status="Available"
	  	@driver.save
	  	@ride.save
	  end
      @driver_id= DriverDetail.where(user_id:current_user.id).ids.first
      @ride_history = Ride.all.select { |m| m.driver_detail_id == @driver_id}

  end

  def edit
		@driver = User.find(params[:id])
   end

  def accept_ride
  	
  	@ride=Ride.find(params[:ride])
  	@driver=DriverDetail.find(DriverDetail.where(user_id:params[:driver]).ids).first
		  	
  	@ride.status="running"
  	@driver.status="Occupied"
  	@driver.save
  	if @ride.save
  		redirect_to ride_path(current_user.id) 
  	end
  end

  def ride_request
		@driver = DriverDetail.where(user_id:current_user.id).ids
   	@ride =	Ride.where(driver_detail_id:@driver, status:"pending")
   		
   		if @ride.nil? || @ride==[]
   			 flash[:alert] = "No Ride Requests!"
   			render :action => :index
   		end
   end
end
