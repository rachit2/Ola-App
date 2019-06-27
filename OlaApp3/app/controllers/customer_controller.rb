class CustomerController < ApplicationController

	def index 
	end 


	def create
 		

	end

	def book_a_cab
		
		#1. If customer is present in RoleUser?
		#2. Find Cab Status i.e Available or not 
		#3. if Available, Book a cab, change cab status to running, and create a ride_details

	end

	def lists_cab
		#1. List of Cabs associated with drivers where driver status is available

		# drivers = DriverDetails.all
		
		# #2. Fetch cabdetails associated with driverdetails 
		
		# drivers = DriverDetails.map{|driver| [--------]}

		# Redirect to Cutomer View
	end

def show
end
def update
  @customer = current_user.id
 
  if @customer.update(customer_params)
  	byebug
    redirect_to customer_path, :id => current_user.id
  else
    render 'edit'
  end
end

def edit
@customer = current_user.id
end
private
  def customer_params
    params.require(:user).permit(:name, :email,:mobile,:address)
  end
end