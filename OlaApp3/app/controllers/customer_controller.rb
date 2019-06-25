class CustomerController < ApplicationController

	def index 
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




end
