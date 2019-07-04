# frozen_string_literal: true

class DriversController < ApplicationController
  def index
    if params[:ride].present?
      @ride=Ride.find(params[:ride])
      @driver=DriverDetail.find(DriverDetail.where(user_id:params[:driver]).ids).first
      @ride.status="rejected"
      @driver.status="Available"
      @driver.save
      @ride.save
    end
   end

  def new
  end
	def update
     @driver = User.find(current_user.id)
     @driver.city_id = City.where(["name = ?", params[:user][:city]]).pluck("id").first
     if @driver.update(driver_params)
       flash[:alert] = "Details Updated!"
       redirect_to :action => :show
     else
       flash[:alert] = "Details Not Updated!"
       render 'show'
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
    @driver = User.find(current_user.id)
  end

  def accept_ride
  	
  	@ride=Ride.find(params[:ride])
  	@driver=DriverDetail.find(DriverDetail.where(user_id:params[:driver]).ids).first
		  	
  	@ride.status="running"
  	@driver.status="Occupied"
  	@driver.save
  	if @ride.save
  		redirect_to ride_path(@ride.id)
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


  private
  def driver_params
    params.require(:user).permit(:name, :email, :mobile, :address)
  end
end
